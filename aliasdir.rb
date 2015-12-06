#!/usr/bin/env ruby



# puts "Hi there !"

# def say_hi(name)
#   puts "Hi " + name
# end

# say_hi("Eric") 
# say_hi("Anne")

# puts "Current dir: " + Dir.pwd

# puts "Dir of this file: " + __dir__
# puts "Just dir name: " + File.basename(Dir.getwd)


#open('customProfile', 'a') { |f|
#  f.puts "Hello, world."
#}


require 'optparse'

options = {}
option_parser = OptionParser.new do |opts|
  opts.banner = "Usage: aliasdir.rb [options]"

  # opts.on("-z", "--[no-]verbose", "Run verbosely") do |v|
  #   options[:theVerbose] = v
  # end

# Mandatory argument.
  # opts.on("-r", "--require LIBRARY",
  #         "Require the LIBRARY before executing your script") do |lib|
  #   options[:theLibrary] = lib
  # end

  opts.on("-a", "--alias alias",
          "Alias name") do |name|
    options[:aliasName] = name
  end

#  opts.on("-v", "--value value",
#          "Alias value") do |value|
#    options[:aliasValue] = value
#  end


# end.parse!
end

# begin
#   option_parser.parse!(ARGV)
# rescue OptionParser::ParseError
#   # if $!.to_s =~ /invalid\s+argument\:\s+(\-\-\S+)\s+\-/
#   #   $stderr.print "Error: missing argument: #{$1}\n"
#   # else 
#   #   $stderr.print "Error: " + $! + "\n"
#   # end  
#   # exit
#   p 'in rescue'
# end

p ARGV

begin option_parser.parse! ARGV
# rescue OptionParser::InvalidOption => e
rescue
  puts 'Invalid parameters.'
#  puts e
  puts option_parser

  # 0 : error
  exit 0
end

if ARGV[0] != nil
  puts "ARGV:" + ARGV[0]
  puts 'Invalid parameters.'
  puts option_parser

  # 0 : error
  exit 0
end

# rescue OptionParser::ParseError
#     p 'toto'

# p options
# p options[:aliasValue]
# p ARGV

# Compose the alias
if options[:aliasName] != nil
    aliasName = options[:aliasName]
else
    # No alias name specified. Use current directory name as in 'cd_currentDirectory'
    aliasName = "cd_" + File.basename(Dir.getwd)
end

aliasValue = "cd " + Dir.pwd

# if options[:aliasValue] != nil
#     aliasValue = options[:aliasValue]
# else
#     # No alias value specified. Set is as 'cd path/to/currentDirectory'
#     aliasValue = "cd " + Dir.pwd
# end

newAlias = "alias " + aliasName + "='" + aliasValue + "'"
puts "newAlias: " + newAlias


pathCustomProfile=ENV["CUSTOM_PROFILE"]
File.open(pathCustomProfile, 'a') { |f| f.puts newAlias }


# 1 : success
exit 1




currentPath = ENV["PATH"]
puts "currentPath="+currentPath

ENV["PATH"] = currentPath + ":" + __dir__
puts "Path: " + ENV["PATH"]

# exec customProfile

# set_var.rb BAR > temp.sh ; . temp.sh

# func to add dir to path ?

pathCustomProfile=ENV["CUSTOM_PROFILE"]
if pathCustomProfile == nil
    puts "CUSTOM_PROFILE environment variable does not exist"
else
    # &&ep check file exist
    if (not File.exist?(pathCustomProfile))
        puts "File " + pathCustomProfile + " does not exist; it was created"
    end

    newAlias="alias cd_" + File.basename(Dir.getwd) + "='cd " + Dir.pwd + "'"
    puts "newAlias: " + newAlias
    File.open(pathCustomProfile, 'a') { |f| f.puts newAlias }
end


