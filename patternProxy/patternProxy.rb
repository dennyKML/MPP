# Інтерфейс, що буде використовуватися як реальним сервісом (готівкою) так і замісником (кредитною карткою)
class Payment
  def process_payment(amount)
    raise NotImplementedError, "Метод має бути перевизначений у похідних класах"
  end
end

# Реальний сервіс, гоітвка
class Cash < Payment
  def process_payment(amount)
    puts "Було сплачено #{amount} у.о."
  end
end

# Проксі клас (заиісник готівка), кредитна картка, із валідацією даних
class CreditCard < Payment
  def initialize(card_number, exp_date)
    @card_number = card_number
    @exp_date = exp_date
    @payment = Cash.new
  end

  def process_payment(amount)
    sleep 2

    status = verify_card

    if status
      @payment.process_payment(amount)
    else
      puts "Оплата не пройшла, спробуйте іншу картку"
    end

    payment_log(status, amount)
  end

  private

  def verify_card
    puts "Перевірка банківської картки #{@card_number} на дійсність..."

    pattern = /^[1-9]\d{3}-\d{4}-\d{4}-\d{4}$/

    month, year = @exp_date.split('/')

    cur_month = Time.now.month
    cur_year = Time.now.year % 100

    if !!(@card_number =~ pattern)
      print "Номер картки - дійсний, "

      if year.to_i > cur_year || (year.to_i == cur_year && month.to_i >= cur_month)
        print "термін дії - дійсний\n"
        true
      else
        print "термін дії - не дійсний!\n"
        false
      end

    else
      print "Номер картки - не дійсний!\n"
      false
    end
  end

  def payment_log(status, amount)
    cur_time = Time.now.to_s.slice(0, 19)
    File.open("patternProxy/payment_log.log", "a") do |file|
      file.puts "[#{cur_time}]\nКартка: #{@card_number}\nСума: #{amount}\nСтатус операції: #{status}"
      file.puts
    end
  end

end

def make_payment(service, amount)
  service.process_payment(amount)
end

# Оплата готівкою
cash = Cash.new
make_payment(cash, 350)

puts

# Оплата карткою
credit_card = CreditCard.new("1234-5678-9012-3456", "9/24")
make_payment(credit_card, 230)

puts

# Перевірка роботи валідації картки
credit_card = CreditCard.new("0234-7321-4219-0984", "10/25")
make_payment(credit_card, 230)

puts

credit_card = CreditCard.new("6234-7321-4219-09865", "10/25")
make_payment(credit_card, 230)

puts

credit_card = CreditCard.new("4234-7321-4219-0984", "8/23")
make_payment(credit_card, 230)