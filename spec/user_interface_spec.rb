require 'user_interface'

describe UserInterface do
  list = { 'sv'=>{ :qty => 20, :name => 'Salt & Vinegar', :price => 75 } }
  let(:display) { described_class.new }

  xit 'asks the user to make a selection' do
		expect(display.product_selection(list)).to output('here are the available products, please make your selection using the sku').to_stdout
    allow(display).to receive(:gets).and_return('sv')
  end

end
