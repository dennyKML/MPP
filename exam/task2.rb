# Використання yield
def method
  puts "First message"
  yield
end

method { puts "Second message" }

# Використання блоку коду всередині фігурних дужок та do end виразу
array = [1, 2, 3, 4, 5, 6]

puts
array.each_with_index do |item, index|
  puts "[#{index}] #{item}"
end

puts
array.each_with_index { |item, index| puts "[#{index}] #{item}" }

# Викораистання proc
proc_var = Proc.new { |x, y| puts "Proc message with coordinates (#{x}, #{y})" }
puts
proc_var.call(1, 2, 3)

# Використання лямба-виразу
sum = lambda { |x, y| return x + y }
puts
puts sum.call(2, 3)
# puts sum.call(1) # Видасть помилку ArgumentError