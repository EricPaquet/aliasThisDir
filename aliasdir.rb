#!/usr/bin/env ruby

puts "Hi there !"


def say_hi(name)
  puts "Hi " + name
end

say_hi("Eric") 
say_hi("Anne")

puts "Current dir: " + Dir.pwd

#open('customProfile', 'a') { |f|
#  f.puts "Hello, world."
#}

puts "Dir of this file: " + __dir__

currentPath = ENV["PATH"]
ENV["PATH"] = currentPath + ":" + __dir__
puts "Path: " + ENV["PATH"]

puts "PATH="+currentPath + ":" + __dir__


# set_var.rb BAR > temp.sh ; . temp.sh


