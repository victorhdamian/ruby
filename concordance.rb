#!/bin/ruby

require 'json'
require 'stringio'



#
# Complete the 'generateAndPrintConcordance' function below.
#
# The function accepts STRING_ARRAY inputLines as parameter.
#

def generateAndPrintConcordance(inputLines)
  # Generate Concordance
  words = Hash.new
  index = 0
  # read each line
  for i in 0...inputLines.size
    # read each sentence
    inputLines[i].to_s.split(/\.|\?|\!/).each do |sentence|
      index +=1
      # read each word
      sentence.split(/\W|\s/).each do |word|
        # per output sample requirement only adds words
        if word != ""
          # per output sample requirement makes all words lower case
          word=word.downcase
          # add words to a hash table as key
          words[word]=words[word]||[0,[]]
          # add word number of occurrences
          words[word][0]+=1
          # add the sentence number where the word occurs
          words[word][1]<<index
        end
      end
    end
  end
  # per output sample requirement sorts hash table key alphabetically
  words = words.sort_by { |key| key }.to_h
  # Print Concordance
  words.each_pair {|key,v| puts "#{key}: {#{v[0]}:#{v[1].to_s.delete('[]')}}"}
end

def printconcordance(words)
  pp words.each_key {|k,v| puts k }
end

inputLines_count = gets.strip.to_i

inputLines = Array.new(inputLines_count)

inputLines_count.times do |i|
  inputLines_item = gets.chomp

  inputLines[i] = inputLines_item
end

generateAndPrintConcordance inputLines

# sample input
#2
#Wait a minute. Wait a minute, Doc.
#Are you telling me that you built a time machine out of a DeLorean?
# sample output
# a: {4:1, 2, 3, 3}
# are: {1:3}
# built: {1:3}
# delorean: {1:3}
# doc: {1:2}
# machine: {1:3}
# me: {1:3}
# minute: {2:1, 2}
# of: {1:3}
# out: {1:3}
# telling: {1:3}
# that: {1:3}
# time: {1:3}
# wait: {2:1, 2}
# you: {2:3, 3}