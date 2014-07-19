require 'menu'

describe Menu do

	let(:menu) { Menu.new 											 								}
	let(:dish) { double :dish, :name => "Faggots", :price => 10 }

	it 'should not contain any dishes initially' do
		expect(menu.dishes).to eq []
	end

	it 'should be able to add new dishes' do
		menu.add_dish(dish)
		expect(menu.dishes).to eq [dish]
	end	

	it 'should know if it contains a dish' do
		expect(menu.contains?(dish.name)).to be false
		menu.add_dish(dish)
		expect(menu.contains?(dish.name)).to be true
	end

	it 'should return the price of a dish given the name' do
		menu.add_dish(dish)
		expect(menu.lookup_price("Faggots")).to eq 10
	end

	it 'should print menu to terminal' do
		menu.add_dish(dish)
		line = "Faggots: 10"
		allow(STDOUT).to receive(:puts)
		expect(STDOUT).to receive(:puts).with(line)
		menu.display
	end

end