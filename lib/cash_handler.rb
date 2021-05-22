class CashHandler

  DEFAULT_CAPACITY = 20.freeze
  COIN_DENOMINATIONS = { "1p" => 1, "2p" => 2, "5p" => 5,
                         "10p" => 10, "20p" => 20, "50p" => 50, 
                         "£1" => 100, "£2" => 200 
                        }.freeze

  attr_reader :denominations, :kitty

  def initialize(denominations = {}, qty = DEFAULT_CAPACITY)
    @denominations ||= COIN_DENOMINATIONS
    coin_list = generate_coins
    @kitty = generate_kitty(coin_list, qty)
  end

  # Using Struct rather than new class initially as I only want to access attributes
  Coin = Struct.new(:face, :pence)

private

  def generate_coins
    denominations.map { | k, v | Coin.new(k, v) }
  end

  def generate_kitty(coins, qty)
    coins.map do | coin |
      [coin[:face], qty: qty, face: coin[:face], pence: coin[:pence]]
    end.to_h
  end

end
