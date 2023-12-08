def thread_func(index)
  puts "Потік #{index} почав виконання."
  sleep(rand(5))
  puts "Потік #{index} завершив виконання."
end

threads = []

# Створення потоків
5.times do |i|
  threads << Thread.new(i) {thread_func(i)}
end

# Очікування завершення всіх потоків
threads.each(&:join)

puts "Всі потоки завершили виконання."
