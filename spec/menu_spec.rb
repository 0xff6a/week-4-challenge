require 'menu'

describe Menu do

	let(:menu) {Menu.new}

	it 'should not contain any dishes initially' do
		expect(menu.dishes).to eq []
	end

	it 'should be able to add new dishes' do
		dish = double :dish, :name => "Faggots"
		menu.add_dish(dish)
		expect(menu.dishes).to eq [dish]
	end	

end