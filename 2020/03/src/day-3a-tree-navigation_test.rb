#!/usr/bin/env ruby

# tobogan and trees
#
# . = open
# # = trees
#
# pattern repeats to the right many times. So given width of data extends by looping.
#
# Starting point is the . at the upper left.
# Goal is to reach the bottom of the map.
#
# by starting in the upper left and moving right 3 and down 1, how many trees would you
# encounter?
#
# mark safe spots with O and collisions with X

SRC="../data/test.txt"

fh=File.open(SRC)

records = fh.readlines.map { | datum | datum.chomp }

rows = records.count
cols = records[0].length

delta_x = 3
delta_y = 1

pos_x = 0
pos_y = 0


puts "The source file has #{rows} rows and #{cols} cols."
puts "At rate of #{delta_x} to the right and #{delta_y} down, would need #{delta_x * rows} columns."
trees_visited=0

def tree_check( lane,x,y,cols)
  tree=0

  x_mod = x % cols
  if lane[x_mod] == "#" then
    tree = 1
  else
    tree = 0
  end

  return tree
end


# Okay, so we need some kind of mapping mechanism...
while pos_y < rows
  # Let's generate positions
  trees_visited += tree_check(records[pos_y],pos_x, pos_y, cols) 
  pos_y += delta_y
  pos_x += delta_x
  puts "Position: #{pos_x},#{pos_y} :: #{trees_visited} trees visited."
end

