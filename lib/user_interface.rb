require 'tty-table'
class UserInterface

  def product_selection(list)
    puts "here are the available products, please make your selection using the sku"
    puts generate_menu(list)
    gets.chomp
  end

  def payment_request(value)
    puts "Please enter the value of coins submitted (in pence), \
          which must be #{value} pence or more. Change is available."
    gets.chomp.to_i
  end

  private

  def generate_menu(stock_list)
    products = stock_list.map { |k, v| [k, v[:name], v[:price]] }
    table = TTY::Table.new( %w[sku, product, price], products)
    puts table.render(:ascii)
  end

end
