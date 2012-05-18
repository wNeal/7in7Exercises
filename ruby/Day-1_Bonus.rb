#!/usr/bin/env ruby
#################################################
# Author: Weston Neal
# Date: 5/18/2012
# Desctipion: 
#   Have the user guess the correct number
#################################################

# Initailize the number to be guessed 
# and the users number
num = rand(10)
input = 0

def guess(num)
  # get the users guess
  input = gets.to_i

  # check if it was right
  if input == num
    puts 'Right'
  else
    # Wrong try again...
    puts 'Nope' 
    return guess(num)
  end
end

guess(num)
