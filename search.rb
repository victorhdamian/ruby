

#linearearch recursive
def linearsearch_r(array, ll, ul, value)
  return "Not found" if ul < ll                # O(1)
  return ll if array[ll] == value              # O(1)
  return linearsearh_r(array, ll + 1, ul, value) # O(n)
end
#linearearch Iterative
def linearsearch_i(array, value)
  for i in 0...(array.length - 1)                         # O(n)
    return "found at index #{i}" if array[i] == value  # O(1)
  end
  return "Not found"                                      # O(1)
end

#binarysearch
def binarysearch(array, ll, ul, value)
  return "Value not found. Please inser value after index #{ll - 1}" if ul < ll
  mid = (ll + (ul - ll)/2).floor
  if value == array[mid]
    return "found at index #{mid}"
  elsif value < array[mid]
    return binarysearch(array, ll, mid - 1, value)
  elsif value > array[mid]
    return binarysearch(array, mid + 1, ul, value)
  end
end

a = [35, -8, 11, 1, 68, 0, 3, 45, 78, 99, 23]

p linearsearch_r(a, 0, a.length, 4)
p linearsearch_i(a, 78 )
p a.sort!
p binarysearch(a, 0, a.length, 4)
