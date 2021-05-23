require 'tty-table'
class UserInterface

  def product_selection(list)
    puts "here are the available products, please make your selection using the sku"
    puts generate_menu(list)
    gets.chomp
  end

  def payment_request(value)
    cash_entered = 0
    puts "Please enter the value of coins submitted (in pence), \
which must be #{value} pence or more. Change is available."
    cash_entered += gets.chomp.to_i
    until cash_entered >= value
      puts "You have entered #{cash_entered}, please top up to at least #{value}"
      cash_entered += gets.chomp.to_i
    end
    cash_entered
  end

  def show(product)
    puts "Thanks and enjoy your ***#{product[:name]}***"
  end

  def next_vend
    puts "\n"
    puts '***********************'
    puts "\n"
    puts 'Ready for the next transaction. Press CTRL C to quit.'
  end

  private

  def generate_menu(stock_list)
    products = stock_list.map { |k, v| [k, v[:name], v[:price]] }
    table = TTY::Table.new( %w[sku product price], products)
    puts table.render(:ascii)
  end

end
