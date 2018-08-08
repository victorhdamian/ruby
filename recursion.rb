# O(2^n) Recursive or Naive Fibonacci
def fibonacci(n)
   n <= 1 ? n :  fibonacci( n - 1 ) + fibonacci( n - 2 )
end

def factorial(n)
  return 1 if n <= 1 || n == 100
  return n * factorial(n-1)
end

=begin
The objective is to move the entire stack to another rod,
obeying the following simple rules:
1. Only one disk can be moved at a time.
2. Each move consists of taking the upper
   disk from one of the stacks and placing it
   on top of another stack or on an empty rod.
3. No disk may be placed on top of a smaller disk.

=end
def towerofhanoi(pieces, sourcepeg, destinationpeg, extrapeg)
 if pieces == 0 then
   return "no pieces to move"
 end
 towerofhanoi(pieces-1,sourcepeg,extrapeg,destinationpeg)
 puts "moved #{pieces} from " + "#{sourcepeg} to #{destinationpeg}"
 towerofhanoi(pieces-1,extrapeg,destinationpeg,sourcepeg)
end

def move(n, source, target, auxiliary)
  if n > 0
        # move n - 1 disks from source to auxiliary, so they are out of the way
    move(n - 1, source, auxiliary, target)

        # move the nth disk from source to target
    target.push(source.pop)

        # Display our progress
    puts "#{source} #{target} #{auxiliary} moved #{n}\n"

        # move the n - 1 disks that we left on auxiliary onto target
    move(n - 1, auxiliary, target, source)
  end
end
# initiate call from source A to target C with auxiliary B

puts fibonacci(9)
towerofhanoi(3,'A','B','C')
A = [3, 2, 1]
B = []
C = []
puts "#{A} #{B} #{C}"
move(3, A, B, C)
p factorial(3)
