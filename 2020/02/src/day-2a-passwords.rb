#!/usr/bin/env ruby
# Hmm... passwords...

# Entries

# 1-3 a: abcde

# 1-3 = a at least 1 times, but at most 3 times.
# 1-3 b: cdefg 
# This is not valid, no 'b'
# 2-9 c: cccccc
# valid... c's

# Given the input data... determine how many passwords are valid.

SRC="../data/input.txt"

fh=File.open(SRC)

records = fh.readlines.map { | datum | datum.chomp }
valid_pass = 0

def count_chars( src, key )
  count = 0
  for i in 0..(src.length-1) do
    if src[i] == key then
      count += 1
    end
  end
  return count
end


for pcount in records do
  lmin=pcount.split[0].split(/-/)[0].to_i
  lmax=pcount.split[0].split(/-/)[1].to_i
  lchr=pcount.split[1].split(/:/)[0]
  pass=pcount.split[2]

  lcnt=count_chars( pass , lchr )
  if (lcnt >= lmin ) && ( lcnt <= lmax ) then
    valid_pass += 1
  end
end

puts "#{valid_pass} valid passwords."
