#!/usr/bin/env ruby
#
# 
# - gamma = most common bit takes that bits position.
# - epsilon = least common bit
# - power = gamma * epislon

# 000110101101


file        = File.open("input.txt")
diagnostics = file.readlines.map(&:chomp)

digits = diagnostics[0].length

gamma   = "0" * digits
epsilon = "0" * digits
code_0  = [0] * digits
code_1  = [0] * digits

for diagcode in diagnostics do
  chunk = diagcode.to_s
  for bit in 0..(digits-1) do
    if chunk[bit] == "0" then
      code_0[bit] += 1
    end
    if chunk[bit] == "1" then
      code_1[bit] += 1
    end
  end
end

for bit in 0..(digits-1) do
  if (code_0[bit] > code_1[bit] ) then
    gamma[bit]   = "0"
    epsilon[bit] = "1"
  else
    gamma[bit]   = "1"
    epsilon[bit] = "0"
  end
end

gamma_dec   = gamma.to_i(2)
epsilon_dec = epsilon.to_i(2)

puts "#{gamma}:#{gamma_dec} , #{epsilon}:#{epsilon_dec} => #{epsilon_dec * gamma_dec}"



#
#for bit in 0..(diagcode.count - 1) do
#
#  if code_0[bit] > code_1[bit] then
#    gamma[bit]="0"
#    epislon[bit]="1"
#  end
#  if code_0[bit] < code_1[bit] then
#    gamma[bit]="1"
#    epislon[bit]="0"
#  end
#
#end
#
#puts "#{gamma}"
#puts "#{epsilon}"
