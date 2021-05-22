require_relative 'inventory'
require_relative 'cash_handler'

class VendingMachine

  attr_reader :inventory, :cash_handler

  def initialize(inventory = Inventory.new, cash_handler = CashHandler.new)
    @inventory = inventory
    @cash_handler = cash_handler
  end

  def kitty_value
    cash_handler.amount
  end

  def product_count
    inventory.total_products
  end
end
