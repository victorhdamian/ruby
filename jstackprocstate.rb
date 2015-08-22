#!/usr/bin/ruby
require 'open3'
# Ruby script that takes the PID and interval(in seconds) as input on the command line and then run jstack and print out the number of threads in different states, then sleeps interval seconds and run it again in an infinite loop
#

#takes the PID and interval(in seconds) as input on the command
myPid = ARGV[0]
myInterval = ARGV[1]

def jstackprocstate(jPid)
  Open3.pipeline_rw("grep Thread.State", "awk '{print $2}'", "sort","uniq -c") {|i, o, ts|
    i.puts %x{/usr/bin/jstack -l #{jPid}}
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
#ruby jstackprocstate.rb 11386 2

#ref.:
#http://ruby-doc.org/stdlib-2.1.0/libdoc/open3/rdoc/Open3.html
#http://docs.oracle.com/javase/7/docs/technotes/tools/share/jstack.html
