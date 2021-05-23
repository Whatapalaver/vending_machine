require_relative 'inventory'
require_relative 'cash_handler'
require_relative 'user_interface'

class VendingMachine

  attr_reader :inventory, :cash_handler, :user_display, :user_selection

  def initialize(inventory = Inventory.new, cash_handler = CashHandler.new, user_interface = UserInterface.new)
    @inventory = inventory
    @cash_handler = cash_handler
    @user_display = user_interface
    @user_selection = nil
  end

  def kitty_value
    cash_handler.amount
  end

  # I think I can delete this - just put in for the test
  def product_count
    inventory.total_products
  end

  def run
    initiate_transaction
    request_payment
    vend
  end

  private

  def is_valid?
    inventory.listed?(user_selection)
  end

  def in_stock?
    inventory.in_stock?(user_selection)
  end

  def find_product(sku)
    inventory.stock[sku]
  end

  def reset_selection
    @user_selection = nil
  end

  # Machine Run Processes
  def initiate_transaction
    reset_selection
    until is_valid? && in_stock?
      @user_selection = user_display.product_selection(inventory.stock)
    end
  end

  def request_payment
    cash_required = find_product(user_selection)[:price]
    user_display.payment_request(cash_required)
  end

  def vend
    inventory.reduce_by_one(user_selection)
    item = find_product(user_selection)
    user_display.show(item)
    user_display.next_vend
    run
  end

end
