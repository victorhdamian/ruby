def evaluate?(word)
  word = word.downcase.gsub(/\s+/, '')
  word = word.gsub(/[^a-z0-9\s]/i, '')
  if word == word.reverse
      return true
  else
      return false
  end
end

puts mystring = "110011"
puts evaluate?(mystring)

puts mystring = "110011xyz"
puts evaluate?(mystring)

puts mystring = "RaceCar" # should be true
puts evaluate?(mystring)

puts mystring = "never odd or even" # should be true
puts evaluate?(mystring)

puts mystring = "A man, a plan, a canal: Panama!" # should be true
puts evaluate?(mystring)

#!/usr/bin/env ruby
=begin
Closest Palindrome
https://practice.geeksforgeeks.org/problems/closest-palindrome/0
https://en.wikipedia.org/wiki/Palindromic_number
Submissions: 9687   Accuracy: 3.83%   Difficulty: Hard
Given a number N. our task is to find the closest Palindrome number whose absolute difference with given number is minimum.
Input:
The first line of the input contains integer T denoting the number of test cases. Each test case contains a  number N.
Output:
For each test case, the print the closest palindrome number.
Note:  If the difference of two closest palindromes numbers is equal then we print smaller number as output.
My notes: if the input n for a test case t is itself a palindrome
it is considered the "number whose absolute difference with given number is minimum"
in Test Case 1: closest palindrome number is 8
however 9 is also a palindrome and it is the closests to itself
|8|-|9| = 1 however |9|-|9| = 0 and |0| < |1|
Constraints:
1<=T<=1000
1<=n<=10^14
Input :
2
9
489

output:
9
484

Explanation :
Test Case 1: closest palindrome number is 8.
=end

index = 0
puts "input # of test cases (T)"
t = gets.chomp
t = t.to_i
testcases = Array.new(t)

for index in (index...testcases.length)
  puts "Enter numbers (N)"
  n = gets.chomp
  n = n.to_i
  testcases[index] = n
end

puts "\n"
puts "output:"

def palindrome?(word)
  return true if word == word.reverse
  #return word if word == word.reverse
end

def evaluate(number) # Closest Palindrome
  #number-=1 #if number can not be the minimal or the same number entered
  if palindrome?("#{number}")
    return number
  else
    number-=1
    evaluate(number)
  end
end

testcases.each do |number|
   puts evaluate(number)
end
