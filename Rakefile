require_relative './config/environment.rb'
require "sinatra/activerecord/rake"

# Task to start rake console
desc "Start app console in terminal"
task :c do 
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  ARGV.clear
  cols = Rake.application.terminal_width
  system "clear"
  puts "*" * cols
  puts "    Welcome to the Rake Console    ".center(cols, "*")
  puts "*" * cols
  Pry.start
end