require 'dish'

describe Dish do

	let(:dish) { Dish.new("Faggots")	}

	it 'should have a name' do
		expect(dish.name).to eq "Faggots"
	end

	it 'should have a price intially' do
		expect(dish.price).to eq Dish::DEFAULT_PRICE
	end

	it 'the price can be set on initialisation' do
		expect(Dish.new("Caviar", 120).price).to eq 120
	end

end