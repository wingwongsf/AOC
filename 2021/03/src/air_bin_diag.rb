#!/usr/bin/env ruby
#
# - get oxygen generator rating and CO2 scrubber rating
# - first bit: keep bit criteria for the value you are looking for.
# - if only 1 number left, stop. This is the one.
# - repeat with the next bit to the right.
#
# - bit criteria
# - oxygen
#   - most common value in the current bit position. Only keep numbers with that bit in
#     that position.
#   - if 0/1 are equally common, keep values with a 1 in the position.
# - CO2 scrubber
#   - least common value in the current bit position. Keep only numbers with 
#     that bit in that position.
#   - if 0/1 are equally common, keep values with a 0 in that position.
#
#   So looks like I will have to find the most common and least common bits...
#   then from that, determine which values to keep and which ones to not keep.

# 000110101101


file        = File.open("input.txt")
diagnostics = file.readlines.map { |zed| zed.chomp }


def get_most_common( datasource , position )
  if datasource[0] == nil then
    puts "nil datasource"
    exit
  else
    digits = datasource[0].length
  end
  code_0  = [0] * digits
  code_1  = [0] * digits

  for diagcode in datasource do
    chunk = diagcode.to_s
    bit = position.to_i
    if chunk[bit] == "0" then
      code_0[bit] += 1
    end
    if chunk[bit] == "1" then
      code_1[bit] += 1
    end
  end

  if code_0[bit] == code_1[bit] then
    same_bit = 1
  else
    same_bit = 0
  end

  if code_0[bit] > code_1[bit] then
    return [0,same_bit]
  else
    return [1,same_bit]
  end
end




def filter_by_bit( datasource , position, bitvalue )
  filtered = []
  for datum in datasource do
    if datum.to_s[position] == bitvalue.to_s then
      filtered.append(datum)
    end
  end
  return filtered
end



final_rating = [0] * 2
digits = diagnostics[0].length

puts "There are #{diagnostics.length} entries."


shorter_diag=Marshal.load(Marshal.dump(diagnostics))

for bit in 0..(digits-1) do

  bit_value, bit_same = get_most_common( shorter_diag, bit)
  shorter_diag = filter_by_bit( shorter_diag, bit, bit_value)

  if shorter_diag.length == 1 then
    puts "### Final reading: #{shorter_diag}"
    break
  else
    puts ">> There are #{shorter_diag.length} entries."
  end
end

oxy_rating=shorter_diag[0].to_i(2)


file        = File.open("input.txt")
diagnostics = file.readlines.map { |zed| zed.chomp }
shorter_diag_b=Marshal.load(Marshal.dump(diagnostics))
digits = diagnostics[0].length

puts ">> There are #{shorter_diag_b.length} entries."

for bit in 0..(digits-1) do

  bit_value, bit_same = get_most_common( shorter_diag_b, bit)

  if bit_same == 1 then
    bit_value = 0
  else
    if bit_value == 0 then
      bit_value = 1
    else
      bit_value = 0
    end
  end

  shorter_diag_a = filter_by_bit( shorter_diag_b, bit, bit_value)
  shorter_diag_b = Marshal.load(Marshal.dump(shorter_diag_a))

  if shorter_diag_b.length == 1 then
    puts "### Final reading: #{shorter_diag_b}"
    break
  else
    puts ">> There are #{shorter_diag_b.length} entries."
  end
end

co2_rating=shorter_diag_b[0].to_i(2)

puts "#{oxy_rating} _ #{co2_rating} :: #{ oxy_rating * co2_rating }"
