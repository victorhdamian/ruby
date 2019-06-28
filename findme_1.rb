def solution(strings)
  # Type your solution here
  return '' if strings.empty?
  min, max = strings.minmax
  prfx = min.size.times{ |i| break i if min[i] != max[i] }
  return min[0...prfx]
end

s = ["abcdef","abcghi","abcabc"]
puts solution(s)
