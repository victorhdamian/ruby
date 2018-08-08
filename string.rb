def balancedstring?(string)
  return false if string.length.odd? # checking for pairs
  return false if string =~ /[^\[\]\(\)\{\}]/ #regex checking for invalid symbol
  puts "string is empty" if string.length == 0
  string.

  pairs = { '{' => '}','[' => ']', '(' => ')' } # hash of symbol pairs

  stack = []
  string.chars do |bracket|
    if accepted_symbol = pairs[bracket]
      stack << accepted_symbol
    else
      return false unless stack.pop == bracket
    end
  end

  stack.empty?
end

puts balancedstring?("{{}()}")
