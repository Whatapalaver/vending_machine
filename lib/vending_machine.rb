require_relative 'inventory'
require_relative 'cash_handler'
require_relative 'user_interface'

class VendingMachine

  attr_reader :inventory, :cash_handler, :user_display, :user_selection

  def initialize(inventory = Inventory.new, cash_handler = CashHandler.new, user_interface = UserInterface.new)
    @inventory = inventory
    @cash_handler = cash_handler
    @user_display = user_interface
    @user_selction = nil
  end

  def kitty_value
    cash_handler.amount
  end

  def product_count
    inventory.total_products
  end

  def initiate_transaction
    @user_selection = user_display.product_selection(inventory.stock)
  end

  def request_payment(product)
    cash_required = product[:price]
    user_display.payment_request(cash_required)
  end

  def find_product(sku)
    inventory.stock[sku]
  end

end
