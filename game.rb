conditions = {"Rock" => "Scissors", "Paper" => "Rock", "Scissors" => "Paper"}

usr_choice = ARGV[0]
cmp_choice = ARGV[1]

if conditions[usr_choice] == cmp_choice
  puts("You won!")
elsif usr_choice == cmp_choice
  puts("Draw!")
elsif conditions[cmp_choice] == usr_choice
  puts("You lose!")
else
  puts("Sorry, I can't speak wrong!")
end
