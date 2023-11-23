# Модуль Printable, що використовує метапрограмування для створення методу print_info у будь-якому класі,
# в який було включено цей модуль, а також для об'єкта якого було викликано цей метод.
#
# В цьому модулі було створенно метод included, який викликається при включенні модуля в клас.
# Використовуємо define_method для динамічного створення методів print_info та method_missing у класах.

module Printable
  def self.included(my_class)
    my_class.send(:define_method, :print_info) do
      puts "Current object info: #{self.inspect}"
    end

    my_class.send(:define_method, :method_missing) do |m_name, *args|
      puts "There is no method #{m_name} for #{self.class}"
    end
  end
end