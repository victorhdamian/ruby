=begin


        worst slow --------> best fast
           exponential  -> Logarythmic -> linear -> SQRroot -> Logarythmic -> Constant
        O(2^n) -> O(n^2) -> O(n·log(n)) ->   O(n) -> O(√n)   -> O(log(n))   -> O(1)
---------------------------------------------------------------------------------------
n=20    1s        1s        1s               1s
n=50    13d       1s        1s               1s
n=10^2  4*10^13y  1s        1s               1s
n=10^6            17m       1s               1s
n=10^9            30y       30s              1s
---------------------------------------------------------------------------------------
max n   30        10^4.5    10^7.5           10^9

 Bubble sort :  O(n^2) Adaptive: O(n) when nearly sorted
 Selection sort: Θ(n^2) Not adaptive
 Insertion sort: O(n^2) Adaptive: O(n) when nearly sorted
 Heap sort : O(n·log(n)) Seudo Adaptive
 Merge sort : O(n·log(n))
 Bucket sort : O(n)
=end


=begin
Bubble sort
Stable
O(1) extra space
O(n^2) comparisons and swaps
Adaptive: O(n) when nearly sorted

=end
def bubblesort(a)
   n = a.length
   for i in 0...n-1
    swapped = false
    for j in 0...n - i - 1
        if a[j]>a[j+1]
            temp=a[j]
            a[j]=a[j+1]
            a[j+1]=temp
            swapped = true
        end
    end
    if swapped == false
        break
    end
    #p a
   end
   return a
end

=begin
Selection sort
Not stable
O(1) extra space
Θ(n^2) comparisons: as i grows the # of eterations for j decreases by 1
Θ(n) swaps
Not adaptive

selectionsort(A[0...n])
for i from 0 to n: => i+1 to n
 minindex <- i
 for j from i + 1 to n: => (n-1)+(n-2)+...+1
   if A[j] < A[minindex]
 swap(A[i],A[minindex])
=end
def selectionsort(a)
  for i in 0...a.length
    minindex = i
    for j in i+1...a.length
      if a[j] < a[minindex]
        minindex = j
      end
      temp = a[minindex]
      a[minindex] = a[i]
      a[i] = temp
    end
    #p a #uncoment the print "p" to visualize steps
  end
  return a
end

=begin
Insertion sort
Stable
O(1) extra space
O(n2) comparisons and swaps
Adaptive: O(n) time when nearly sorted

=end
def insertionsort(a)
    for i in 1...(a.length)
        j=i
        while j>0
            if a[j-1]>a[j]
                temp=a[j]
                a[j]=a[j-1]
                a[j-1]=temp
            else
              break
            end
            j=j-1
        end
    #p a #uncoment the print "p" to visualize steps
    end
    return a
end

=begin
Heapsort
stable: Not
O(1) extra space (see discussion)
O(n·lg(n))
adaptive: Not really

root_index = (index -1)/2 # round down or floored
left_leaf = 2 * index + 1
right_leaft = 2 * index + 2

      | n-1 |
      | --- |
      |_ 2 _|
        /
       n
     /   \
(2*i+1) (2*i+2)

format array as a binary tree
sort for max heap (each root node >= leaf nodes) or min heap (each root node is <= its leaf nodes)
=end

def heapsort(array, type)
  if array.length <= 1
    return  puts "invalid input"
  end
  unless type == "min" || type == "max"
    return  puts "invalid input"
  end

  n = array.size
  a = [nil] + array             # heap root [0]=>[1]
  (n / 2).downto(1) do |i|
    hepify(a, i, n, type)
    #p a #uncoment the print "p" to visualize steps
  end
  while n > 1
    a[1], a[n] = a[n], a[1]
    n -= 1
    hepify(a, 1, n, type)
    #p a #uncoment the print "p" to visualize steps
  end
  return a.drop(1)                     # heap root [1]=>[0]
end

def hepify(a, parent, size, type)
  node = a[parent]
  while (child = 2 * parent) <= size
    case type
      when "max"
        child += 1  if child < size and a[child] > a[child + 1]
        break  if node <= a[child]
      when "min"
        child += 1  if child < size and a[child] < a[child + 1]
        break  if node >= a[child]
    end
    a[parent] = a[child]
    parent = child
  end
  return a[parent] = node
end

=begin
Merge sort
Stable: Yes
Θ(n) extra space for arrays (as shown)
Θ(lg(n)) extra space for linked lists
Θ(n·lg(n)) time
adaptive: Not
Does not require random access to data

mergesort(A[1...n])
if n = 1:
  return a
m <- |_ n/2 _|
B <- mergesort(A[1...m])
C <- mergesort(A[m+1...n])
D <- merge(B, C)
return D

merge(B[1..p],C[1..q])
D <- empty array of size p + q
while B and C and not both empty
 x <- first element of B
 y <- first element of C
 if x <= y
   move x from B to the end of D
 else
   move y from C to the end of D
move the rest of B and C to the end of D
return D
=end
def mergesort(a)
  return a if a.length == 1
  m = a.length/2.floor
  b = a[0...m].sort!
  c = a[m...a.length].sort!
  r = merge(b,c)
  return r
end

def merge(b,c)
  d = Array.new(b.length + c.length)
  while b.empty? == false && c.empty? == false
    x = b[0]
    y = c[0]
    if x <= y
      d.push(x)
      b.shift
    else
      d.push(y)
      c.shift
    end
    d.shift
  end
  b.each do |z|
    d.push(z)
    d.shift
  end
  c.each do |w|
    d.push(w)
    d.shift
  end
  return d
end




p 'bubblesort'
p bubblesort(Array.new(8) { rand(-10...9) })
p 'insertionsort'
p insertionsort(Array.new(8) { rand(-20...30) })
p 'selectionsort'
p selectionsort(Array.new(8) { rand(-40...50) })
p 'heapsort'
#p array = [35,-8, 11, 1, 68, 0, 3]
p array = [35, -8, 11, 1, 68, 0, 3, 45, 78, 99, 23]
p 'min heap'
p heapsort(array, "min")
p 'max heap'
p heapsort(array, "max")
p 'mergesort'
p mergesort(Array.new(8) { rand(-60...70) })
