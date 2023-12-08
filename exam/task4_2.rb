counter = 0
counter_mutex = Mutex.new

threads = []

# Створення потоків
10.times do
  threads << Thread.new do
    counter_mutex.synchronize do
      local_counter = counter
      local_counter += 1
      sleep(rand(2))
      counter = local_counter
    end
  end
end

# Очікування завершення всіх потоків
threads.each(&:join)

puts "Загальний лічильник на початку: 0\nЗагальний лічильник в кінці (10 потоків, що збільшують лічильник): #{counter}"