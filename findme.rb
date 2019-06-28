def solution(numbers, k)
  # Type your solution here
  numbers = bubblesort(numbers)
  puts numbers[k-1]
end

  def bubblesort(a)
    n = a.length
    for i in 0...n-1
      swapped = false
      for j in 0...n - i - 1
        if a[j]<a[j+1]
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

numbers = [1,4,3,4,2,5]
k = 3
solution(numbers,k)