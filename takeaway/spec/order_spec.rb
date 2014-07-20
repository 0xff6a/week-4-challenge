require 'order'

describe Order do
	
	let(:multiple)	{ 2 																						}
	let(:order) 		{ Order.new																			}
	let(:dish)  		{ double :dish, :name => "yum", :price => 25.0 	}

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

	it 'knows if the total is valid' do
		order.add(dish)
		expect(order).to be_valid
	end

	it 'knows if the total is not valid' do
		order.total = multiple
		expect(order).not_to be_valid
	end

	it 'can display the order' do
		order.add(dish)
		allow(STDOUT).to receive(:puts)
		expect(STDOUT).to receive(:puts).with("yum 1x @ £25.0")
		order.display
	end

end