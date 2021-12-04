#!/usr/bin/env ruby
#
# find the two entries that add up to 2020... then give the product as an answer

SRC="../data/input.txt"

fh=File.open(SRC)

records = fh.readlines.map { | datum | datum.chomp }

for i in records do
  for j in records do
    for k in records do
      i_v = i.to_i
      j_v = j.to_i
      k_v = k.to_i
      if i_v + j_v + k_v == 2020 then
        answer_a = i_v
        answer_b = j_v
        answer_c = k_v
        break
      end
    end
  end
end

puts "#{answer_a}+ #{answer_b} + #{answer_c} = #{answer_a+answer_b+answer_c} and product is #{answer_a * answer_b * answer_c}"
