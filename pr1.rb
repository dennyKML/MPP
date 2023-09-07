variants = %w[Rock Paper Scissors]

while true
  puts("\nMake your choice: Rock, Paper or Scissors (exit to leave)")
  usr_choice = gets.chop.capitalize

  if usr_choice == "Exit"
    break
  end

  cmp_choice = variants[rand(0..2)]
  puts("Computer choice - #{cmp_choice}")

  if usr_choice == cmp_choice
    puts("Draw!")
  elsif (usr_choice == variants[0] and cmp_choice == variants[1]) or (usr_choice == variants[1] && cmp_choice == variants[2]) or (usr_choice == variants[2] && cmp_choice == variants[0])
    puts("You lost!")
  elsif (usr_choice == variants[0] and cmp_choice == variants[2]) or (usr_choice == variants[1] && cmp_choice == variants[0]) or (usr_choice == variants[2] && cmp_choice == variants[1])
    puts("You won!")
  else
    puts("I can't speak wrong, sorry!")
  end
end