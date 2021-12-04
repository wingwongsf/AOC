#!/usr/bin/env ruby
#
# Sliding window of sums. Determine the number of sums that are increasees

file = File.open("input.txt")
depths=file.readlines.map(&:chomp)

dive_depth = 0
dive_horizontal = 0

for depth in 0..(depths.count-1) do

  entry = depths[depth].split
  cmd = entry[0]
  value = entry[1].to_i

  if cmd == "forward" then
    dive_horizontal = dive_horizontal + value
  end

  if cmd == "down" then
    dive_depth = dive_depth + value
  end

  if cmd == "up" then
    dive_depth = dive_depth - value
  end

  puts "#{cmd} => #{value} , #{dive_depth} x #{dive_horizontal} => #{ dive_depth * dive_horizontal }"
end

puts "Final depth: #{dive_depth} , dive_horizontal #{dive_horizontal} => #{ dive_depth * dive_horizontal }"
