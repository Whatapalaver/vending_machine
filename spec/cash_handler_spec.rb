require 'cash_handler'

describe CashHandler do
  denoms = { "1p" => 1, "2p" => 2, "5p" => 5}
  let(:cash_handler) { described_class.new(denominations = denoms) }

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
end