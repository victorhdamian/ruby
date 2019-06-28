# Returns count of ways to reach n-th
# stair using 1 or 2 or 3 steps.
def findStep(n)
  # Type your solution here
  if n == 1 || n == 0
    return 1
  end
  if n == 2
    return 2
  end
  return solution(n-3) + solution(n-2) + solution(n-1)
end

n = 3

puts findStep(n)