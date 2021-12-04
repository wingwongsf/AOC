#!/usr/bin/env ruby
#
# Sliding window of sums. Determine the number of sums that are increasees

file = File.open("input.txt")
depths=file.readlines.map(&:chomp)
readings=0
depth_increases=0
previous_reading=0

a,b,c = 0
prev_abc=0

for depth in 0..(depths.count - 1) do
  a = depths[depth].to_i
  b = depths[depth + 1].to_i
  c = depths[depth + 2].to_i
  abc = a + b + c
  if readings > 0 then
    if ( abc > prev_abc ) then
      depth_increases = depth_increases + 1
    end
  end
  puts "#{depth} : #{a} , #{b} , #{c} :: #{abc} :: #{depth_increases}"
  prev_abc = abc
  readings = readings + 1
end

puts(depth_increases)
