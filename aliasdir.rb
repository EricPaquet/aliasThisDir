#!/usr/bin/env ruby

puts "Hi there !"


def say_hi(name)
  puts "Hi " + name
end

say_hi("Eric") 
say_hi("Anne")

puts "Current dir: " + Dir.pwd

puts "Dir of this file: " + __dir__
puts "Just dir name: " + File.basename(Dir.getwd)


#open('customProfile', 'a') { |f|
#  f.puts "Hello, world."
#}

currentPath = ENV["PATH"]
puts "currentPath="+currentPath

ENV["PATH"] = currentPath + ":" + __dir__
puts "Path: " + ENV["PATH"]

puts "PATH="+currentPath + ":" + __dir__

# exec customProfile

# set_var.rb BAR > temp.sh ; . temp.sh


