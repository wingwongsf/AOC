#!/usr/bin/env ruby
#
# find the two entries that add up to 2020... then give the product as an answer

SRC="../data/input.txt"

fh=File.open(SRC)

records = fh.readlines.map { | datum | datum.chomp }

for i in records do
  for j in records do
    i_v = i.to_i
    j_v = j.to_i
    puts "#{i_v} #{j_v} #{i_v+j_v} #{i_v*j_v}"
    if i_v + j_v == 2020 then
      answer_a = i_v
      answer_b = j_v
      break
    end
  end
end

puts "#{answer_a} and #{answer_b} sums to #{answer_a+answer_b} and product is #{answer_a * answer_b}"
