#!/usr/bin/env ruby

require 'optparse'

options = {}
option_parser = OptionParser.new do |opts|
  opts.banner = "Usage: aliasdir.rb [options]"

  opts.on("-a", "--alias alias",
          "Alias name") do |name|
    options[:aliasName] = name
  end

# Example with optional argument
  # opts.on("-z", "--[no-]verbose", "Run verbosely") do |v|
  #   options[:theVerbose] = v
  # end

end

# Parse options and catch errors
begin option_parser.parse! ARGV
rescue
  puts 'Invalid parameters.'
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

pathCustomProfile=ENV["CUSTOM_PROFILE"]

if pathCustomProfile == nil
    puts "CUSTOM_PROFILE environment variable does not exist"
    exit 0
else
    if (not File.exist?(pathCustomProfile))
        puts "File " + pathCustomProfile + " does not exist; it was created"
    end
end

# Compose the alias
if options[:aliasName] != nil
    # A name for the alias was specified with the "-a" option
    aliasName = options[:aliasName]
else
    # No alias name specified. Use current directory name as in 'cd_currentDirectory'
    aliasName = "cd_" + File.basename(Dir.getwd)
end

# The alias is used to cd to the current directory
aliasValue = "cd " + Dir.pwd

newAlias = aliasName + "='" + aliasValue + "'"
puts "A new alias has been created: " + newAlias
newAlias = "alias " + newAlias

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


