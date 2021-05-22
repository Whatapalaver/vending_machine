require 'vending_machine'

describe VendingMachine do
  let(:crisp_machine) { described_class.new }

  it 'has a kitty by default' do
    crisp_machine.kitty_value > 0
  end

  it 'has stock initially' do
    crisp_machine.product_count > 0
  end
end
