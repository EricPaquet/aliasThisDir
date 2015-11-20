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

# exec customProfile

# set_var.rb BAR > temp.sh ; . temp.sh

# func to add dir to path ?

pathCustomProfile=ENV["CUSTOM_PROFILE"]
if pathCustomProfile == nil
	puts "Environment variable CUSTOM_PROFILE does not exist"
else
	# &&ep check file exist
	if (not File.exist?(pathCustomProfile))
		puts "File " + pathCustomProfile + " does not exist; it was created"
	end

	newAlias="alias cd_" + File.basename(Dir.getwd) + "='cd " + Dir.pwd + "'"
	puts "newAlias: " + newAlias
	File.open(pathCustomProfile, 'a') { |f| f.puts newAlias }
end


