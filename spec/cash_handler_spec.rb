require 'cash_handler'

describe CashHandler do
  denoms = { '1p' => 1, '2p' => 2, '5p' => 5 }
  let(:cash_handler) { described_class.new(denoms) }

  describe '#initialize' do
    it 'generates a kitty' do
      expect(cash_handler.kitty).not_to be_empty
    end

    it 'creates a kitty with an initial quantity' do
      two_pence = cash_handler.kitty['2p']
      expect(two_pence[:qty]).to be > 0
    end

    it 'creates a kitty with coins that have a face description and pence value attribute' do
      two_pence = cash_handler.kitty['2p']
      expect(two_pence[:face]).to eq '2p'
      expect(two_pence[:pence]).to eq 2
    end
  end

  it 'calculates change in coin denomination' do
    expected_change = [{5=>5},{2=>2},{1=>0}]
    expect(cash_handler.return_coins(29)).to eq expected_change
  end
end
