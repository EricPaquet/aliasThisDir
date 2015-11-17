#!/usr/bin/env ruby

puts "Hi there !"


def say_hi(name)
  puts "Hi " + name
end

say_hi("Eric") 
say_hi("Anne")

puts "Current dir: " + Dir.pwd

ENV["toto"]="4"

# echo "hi" > "mycmd.txt"
# File.write("mycmd.txt", "hi\n")
File.write("mycmd.txt", "toto=6\n")
wasGood = system( "echo 'hi'" )
wasGood = system( "echo 'hi2'" )
wasGood = system( "cat mycmd.txt" )

# puts "WG " + {wasGood}

wasGood = system( ". mycmd.txt" )
wasGood = system( "echo apres" )

