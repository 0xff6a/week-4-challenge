require 'customer'

describe Customer do

	let(:number)		{	Customer::DEFAULT_NUMBER				}
	let(:customer) 	{ Customer.new 				 						}
	let(:new_order)	{ double :new_order								}
	let(:menu)			{ double :menu, :display => nil		}
	let(:dish)			{ double :dish, :empty? => false 	}	
	let(:quantity)	{ double :quantity 								}

	before(:each) 	{ allow(STDOUT).to receive(:puts) }

	it 'should have a phone number' do
		expect(customer.phone_number).to be number
	end

  it 'should have no order when created' do
  	expect(customer.order).to be nil
  end

  it 'should be able to create an order' do
  	expect(customer).to receive(:add_items_to_order).and_return(nil)
  	customer.create_order_from(menu, new_order)
  	expect(customer.order).to be new_order
  end

  it 'should be able to send an order to a restaurant' do
  	restaurant = double :restaurant
  	expect(restaurant).to receive(:receive_order).with(customer.order, customer)
  	customer.send_order_to(restaurant)
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
		expect(customer.select_item).to eq [dish, quantity]
  end

  it 'should be able to select multiple items' do
  	expect(customer).to receive(:select_dish).and_return(dish)
  	expect(customer).to receive(:select_quantity).and_return(quantity)
  	expect(customer).to receive(:select_dish).and_return("")
  	expect(new_order).to receive(:add).with(dish, quantity)
  	customer.create_order_from(menu, new_order)
  end

end

