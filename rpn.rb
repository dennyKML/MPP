priorities = { "+" => 1, "-" => 1, "*" => 2, "/" => 2, "^" => 3 }
output, stack = [], []

input = gets.chomp.to_s

input.split(/ */).each do |smb|
  if smb.match?(/[[:digit:]]/)
    output << smb
  elsif smb == "("
    stack << smb
  elsif smb == ")"
    while stack.last != "("
      output << stack.pop
    end
    stack.pop
  else
    while !stack.empty? && priorities[smb] <= priorities[stack.last].to_i  # Додамо to_i, щоб уникнути помилки порівняння з nil
      output << stack.pop
    end
    stack << smb
  end
end

until stack.empty?
  output << stack.pop
end

puts output.join(' ')
