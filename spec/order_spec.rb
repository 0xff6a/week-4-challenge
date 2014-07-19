require 'order'

describe Order do
	
	let(:multiple)	{ 2 														}
	let(:order) 		{ Order.new											}
	let(:dish)  		{ double :dish, :price => 25.0	}

	it 'should not contain any items initially' do
		expect(order.items).to be_empty
	end	

	it 'should have a total of 0 initially' do
		expect(order.total).to eq 0
	end

	it 'an item can be added' do
		order.add(dish)
		expect(order.items.include?(dish)).to be true
	end

	it 'if an item is added twice, its quantity is updated' do
		multiple.times { order.add(dish) }
		expect(order.items[dish]).to be multiple
	end

	it 'can update the total when an item is added' do
		order.add(dish)
		expect(order.total).to eq dish.price
	end

	it 'can check if the total is valid' do
		order.add(dish)
		expect(order).to be_valid
		order.total = 0
		expect(order).not_to be_valid
	end

end