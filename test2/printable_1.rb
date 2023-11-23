# Проста реалізація методу Printable, який просто включає метод print_info у класи, в які було включено цей модуль

module Printable
  def print_info
    puts "Current object info: #{self.inspect}"
  end

  def method_missing(m_name, *args)
    puts "There is no method #{m_name} for #{self.class}"
  end
end