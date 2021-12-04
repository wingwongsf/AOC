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

def match_letter_position( src, key, pos )
  if src[pos-1] == key then
    puts "#{src} #{key} #{pos} valid"
    return true
  else
    puts "#{src} #{key} #{pos} invalid"
    return false
  end
end


for pcount in records do

  tested=0
  pos_a=pcount.split[0].split(/-/)[0].to_i
  pos_b=pcount.split[0].split(/-/)[1].to_i
  lchr=pcount.split[1].split(/:/)[0]
  pass=pcount.split[2]

  pos_a_check = match_letter_position( pass, lchr, pos_a )
  pos_b_check = match_letter_position( pass, lchr, pos_b )

  if (pos_a_check && pos_b_check ) then
    puts "INVALID"
    tested = 1
  end

  if (pos_a_check == false) && ( pos_b_check == false) then
    puts "INVALID"
    tested = 1
  end
 
  if tested == 0 then 
    puts "VALID"
    valid_pass += 1
  end
end

puts "#{valid_pass} valid passwords."
