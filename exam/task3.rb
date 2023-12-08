# Загальний інтерфейс для генерації чисел
class NumbersGenerator
  def generate
    raise "NotImplemented"
  end
end

# Інтерфейс для генерації цілого числа
class IntGenerator < NumbersGenerator
  def generate
    rand(1..100)
  end
end

# Інтерфейс для генерації float-числа
class FloatGenerator < NumbersGenerator
  def generate
    rand * 100
  end
end

# Клас, який використовує генератор
class Processor
  def process(generator)
    gen_num = generator.generate
    puts "Згенероване число: #{gen_num}"
  end
end

int_gen = IntGenerator.new
float_gen = FloatGenerator.new
num_process = Processor.new

num_process.process(int_gen)
num_process.process(float_gen)
