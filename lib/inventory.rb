class Inventory

  DEFAULT_CAPACITY = 20.freeze
  PRICE_LIST = [{sku: 'sv', name: 'Salt & Vinegar', price: 75},
                {sku: 'co', name: 'Cheese & Onion', price: 75}, 
                {sku: 'bs', name: 'Beef Steak', price: 75}, 
                {sku: 'pr', name: 'Pringles', price: 200}]

  attr_reader :stock, :price_list

  def initialize(price_list = [], qty = DEFAULT_CAPACITY)
    @price_list ||= PRICE_LIST
    product_list = generate_products
    @stock = generate_stock(product_list, qty)
  end


  # Using Struct rather than new class initially as I only want to access attributes
  Product = Struct.new(:sku, :name, :price)

private

  def generate_products
    price_list.map { |item| Product.new(item[:sku], item[:name], item[:price]) }
  end

  def generate_stock(product_list, qty)
    product_list.map do | item |
      [item[:sku], qty: qty, name: item[:name], price: item[:price]]
    end.to_h
  end

end
