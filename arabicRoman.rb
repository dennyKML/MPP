ROMAN_NUMS = {
  'I' => 1,
  'IV' => 4,
  'V' => 5,
  'IX' => 9,
  'X' => 10,
  'XL' => 40,
  'L' => 50,
  'XC' => 90,
  'C' => 100,
  'CD' => 400,
  'D' => 500,
  'CM' => 900,
  'M' => 1000
}

def roman_to_int(roman)
  res = 0
  prev_val = 0

  roman.reverse.each_char do |char|
    val = ROMAN_NUMS[char]

    if val < prev_val
      res -= val
    else
      res += val
    end

    prev_val = val
  end

  res
end

def int_to_roman(num)
  res = ''
  ROMAN_NUMS.keys.sort_by { |key| ROMAN_NUMS[key] }.reverse.each do |key|
    while num >= ROMAN_NUMS[key]
      res += key
      num -= ROMAN_NUMS[key]
    end
  end

  res
end

puts "Введіть арабське число для переведення в римське (від 1 до 3999) => "
int_num = gets.chomp.to_i

if int_num >= 1 && int_num < 4000
  roman_num = int_to_roman(int_num)
  puts "Ціле число #{int_num} відповідає римському числу #{roman_num}"

  puts "Римське число #{roman_num} відповідає цілому числу #{roman_to_int(roman_num)}"
else
  puts "Число має належати діапазону від 1 до 3999!"
end