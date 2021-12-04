#!/usr/bin/env ruby
#
# Sliding window of sums. Determine the number of sums that are increasees

file = File.open("input.txt")
depths=file.readlines.map(&:chomp)

aim_depth = 0
aim_horizontal = 0

dive_horizontal = 0
dive_depth = 0

for depth in 0..(depths.count-1) do

  entry = depths[depth].split
  cmd = entry[0]
  value = entry[1].to_i

  if cmd == "forward" then
    aim_horizontal = aim_horizontal + value
    dive_horizontal = dive_horizontal + value
    dive_depth = dive_depth + ( value * aim_depth )
  end

  if cmd == "down" then
    aim_depth = aim_depth + value
  end

  if cmd == "up" then
    aim_depth = aim_depth - value
  end

end

puts "Final depth: #{dive_depth} , Final horizontal: #{dive_horizontal} , product #{dive_depth * dive_horizontal} "
