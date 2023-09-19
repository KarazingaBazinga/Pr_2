def priority(operator)
  case operator
  when '+', '-'
    return 1
  when '*', '/'
    return 2
  when '^'
    return 3
  else
    return 0
  end
end

puts "Enter the expression: "
expression = gets.chomp

output = ""
stack = []

expression.each_char do |char|
  if char.match?(/\d/)
    output += char
    output+=' '
  elsif char == '('
    stack.push(char)
  elsif char == ')'
    while stack.last != '(' && !stack.empty?
      output += stack.pop
      output+=' '
    end
    stack.pop if stack.last == '('
  else
    while !stack.empty? && priority(char) <= priority(stack.last)
      output += stack.pop
      output+=' '
    end
    stack.push(char)
  end
end

until stack.empty?
  output += stack.pop
  output+=' '
end

puts output

