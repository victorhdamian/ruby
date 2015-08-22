#!/usr/bin/ruby
require 'open3'
# Ruby script that takes the PID and interval(in seconds) as input on the command line and then run jstack and print out the number of threads in different states, then sleeps interval seconds and run it again in an infinite loop
#

#takes the PID and interval(in seconds) as input on the command
myPid = ARGV[0]
myInterval = ARGV[1]

def jstackprocstate(jPid)
  Open3.pipeline_rw("grep JVM", "awk '{print $2}'", "sort","uniq -c") {|i, o, ts|
    i.puts %x{sudo jstack -m #{jPid}}
    i.close
    puts o.read
  }
end

unless ARGV.length == 2
  puts "need to arguments a pid and numer of seconds"
  exit
end


#run jstack and print out the number of threads in different states
jstackprocstate(myPid)

#then sleeps interval seconds
sleep(Integer(myInterval))

#run it again in an infinite loop
loop do
  jstackprocstate(myPid)
end

#usage
#ruby rf2.rb 11386 2
