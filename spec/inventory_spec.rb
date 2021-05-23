require 'inventory'

describe Inventory do
  crisp_price_list = [{ sku: 'sv', name: 'Salt & Vinegar', price: 75 }]
  let(:crisp_inv) { described_class.new(crisp_price_list) }
  let(:empty_crisp_inv) { described_class.new(crisp_price_list, 0) }

  describe '#initialize' do
    it 'generates a stock list' do
      expect(crisp_inv.stock).not_to be_empty
    end

    it 'creates a stock list with default quantity' do
      salty_crisps = crisp_inv.stock['sv']
      expect(salty_crisps[:qty]).to be > 0
    end

    it 'creates a stock list with products with name and price attributes' do
      salty_crisps = crisp_inv.stock['sv']
      expect(salty_crisps[:name]).to eq 'Salt & Vinegar'
      expect(salty_crisps[:price]).to eq 75
    end
  end

  it 'can identify if a product is included on the stock list' do
    expect(crisp_inv.listed?('sv')).to be true
  end

  it 'can identify if a product is not included on the stock list' do
    expect(crisp_inv.listed?('not_a_crisp')).to be false
  end

  it 'can determine if a listed product is in stock' do
    expect(empty_crisp_inv.in_stock?('sv')).to be false
  end

  it 'can determine if a listed product is in stock' do
    expect(crisp_inv.in_stock?('sv')).to be true
  end

  it 'can reduce the number of items in stock' do
    salty_crisps = crisp_inv.stock['sv']
    expect { crisp_inv.reduce_by_one('sv') }.to change { salty_crisps[:qty] }.by(-1)
  end
end
