require 'inventory'

describe Inventory do
  crisp_price_list = [{sku: 'sv', name: 'Salt & Vinegar', price: 75}]
  let(:empty_crisp_inv) { described_class.new(price_list = crisp_price_list) }

  describe '#initialize' do
    it 'generates a stock list' do
      expect(empty_crisp_inv.stock).not_to be_empty
    end

    it 'creates a stock list with default quantity' do
      salty_crisps = empty_crisp_inv.stock['sv']
      expect(salty_crisps[:qty]).to be > 0
    end

    it 'creates a stock list with products with name and price attributes' do
      salty_crisps = empty_crisp_inv.stock['sv']
      expect(salty_crisps[:name]).to eq 'Salt & Vinegar'
      expect(salty_crisps[:price]).to eq 75
    end
  end
end