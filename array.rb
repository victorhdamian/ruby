# define input set
data = [1,5,6,8,4,3,5,7,3,2,1]

# define function that takes an array and returns only the set of unique elements
def  showuniquevalueswfunction(array)
  # result array  
  result = Array.new  
  # check if input array is empty
  if array.length > 0 then
      # make the result array iqual to the input array uniq function which returns a new array by removing duplicate values in self.      
      result = array.uniq
  else
      print "Input array is empty. It can not be empty"
  end
  return result
end

def showuniquevalueseteration(array)
  for i in array
    for j in array
      if array[i] == array[j] and i != j
        array.slice!(j)
      end
    end
  end
  return array
end

input= ["FF","E7","C3","E7","FF"]

# define function that takes in a hexahecimal number as a string, 
# converts it to a binary number
# and outputs the binary number replacing 1 for * and 0 for space  
def  converter( array)
    #define hash to convert binary to pixel 
    pixels = { "1" => "*", "0" => " " }
    output = Array.new
    #iterate to input array 
    for i in array
      #populate output array with converted hex to binary values
      #use string hex function to convert input array of hex characters to binary
      output.push(array.to_s[i].hex.to_s(2))  
    end
    #iterate to output array
    for i in output
      # use puts to ouput each element of the output array on a new line
      #use gsub function to replaces binary representation of hex input to pixel hash representation 
      puts output.to_s[i].gsub(/[01]/, '1' => '*', '0' => ' ')
    end
end

#usage
get_uniq_wfunction = showuniquevalueswfunction(data)
get_uniq_iteration =  showuniquevalueseteration(data)
print get_uniq_wfunction, " ",  get_uniq_iteration, "\n"
converter(input)
