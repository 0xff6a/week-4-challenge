require 'customer'

describe Customer do

	let(:number)		{	'+447852349285'									}
	let(:customer) 	{ Customer.new(number) 						}
	let(:new_order)	{ double :new_order							 	}
	let(:dish)			{ double :dish 										}	
	let(:quantity)	{ double :quantity 								}

	it 'should have a phone number' do
		expect(customer.phone_number).to be number
	end

  it 'should have no order when created' do
  	expect(customer.order).to be nil
  end

  it 'should be able to create an order' do
  	expect(new_order).to receive(:add).with(dish, quantity)
  	customer.create_order(new_order, { dish => quantity })
  	expect(customer.order).to be new_order
  end

  it 'should be able to select a dish' do
  	expect(STDOUT).to receive(:puts).with("Please select a dish")
  	expect(STDIN).to receive(:gets).and_return("")
  	customer.select_dish
  end

  it 'should be able to update quantity' do
  	expect(STDOUT).to receive(:puts).with("How many would you like?")
  	expect(STDIN).to receive(:gets).and_return("")
  	customer.select_quantity
  end

  it 'should be able to select an item' do
  	expect(STDOUT).to receive(:puts).with("Item selection - hit enter twice to finish")
  	expect(customer).to receive(:select_dish).and_return(dish)
  	expect(customer).to receive(:select_quantity).and_return(quantity)
		expect(customer.select_item).to include(dish => quantity)
  end

  xit 'should be able to select multiple items' do
  	expect(customer).to receive(:select_item).and_return(dish => quantity)
  	expect(customer).to receive(:select_item).and_return(dish => quantity)
  	expect(customer).to receive(:select_item).and_return("")
  end

end

