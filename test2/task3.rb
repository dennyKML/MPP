# Модуль Printable без використання метапрограмування
# require_relative 'printable_1'

# Модуль Printable із використанням метапрограмування
require_relative 'printable_2'

class String
  include Printable
end

class Person
  include Printable

  def initialize(name, age)
    @name = name
    @age = age
  end
end

hello = "Hello, World!"
hello.print_info1(1)
hello.print_info

person = Person.new("Denis", 19)
person.print_info
