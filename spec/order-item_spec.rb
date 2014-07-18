require 'order-item'


describe OrderItem do
	
	let(:dish) { double :dish 	}
	let(:item) { OrderItem.new 	}

	it 'should have a zero quantity initially' do
		expect(item.quantity).to eq 0
	end

	it 'should not have a dish initially' do
		expect(item.dish).to be nil
	end

	it 'a dish can be added' do
		item.add(dish)
		expect(item.dish).to be dish
	end

	it 'updates quantity when a dish is added' do
		item.add(dish, 2)
		expect(item.quantity).to eq 2
	end

end