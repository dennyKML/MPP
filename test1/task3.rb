class Book
  def initialize(title, author, year)
    @title = title
    @author = author
    @year = year
  end

  def title
    @title
  end

  def author
    @author
  end

  def year
    @year
  end

  def title=(new_title)
    @title = new_title
  end

  def author=(new_author)
    @author = new_author
  end

  def year=(new_year)
    @year = new_year
  end

  # Або всі ці методи заміняються одним рядком:
  # attr_accessor :title, :author, :year
end

book1 = Book.new("Мистецтво любові", "Еріх Фромм", 2016)

puts "'#{book1.title}' - #{book1.author}, #{book1.year}"

book1.title = "Мати або бути?"
book1.year = 2017

puts "'#{book1.title}' - #{book1.author}, #{book1.year}"