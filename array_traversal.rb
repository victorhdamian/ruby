# given an array of numbers, replace each even number with 2 of the same

def replace(input)
  output = Array.new
  if input.nil? || input.size == 0
    print "input array is empty"
  end
  for i in 0...input.size
    if input[i].even? # if input[i] % 2 == 0
      output.push(input[i])
      output.push(input[i])
    else
      output.push(input[i])
    end
  end
  return output
end

myarray = [1,2,5,6,8]
#output = [1,2,2,5,6,6,8,8]

print replace(myarray)

# traversing from both end
# find 2 numbers in a sorted array that sum to x


