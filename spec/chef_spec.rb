require 'chef'
require 'CSV'

describe Chef do

	let(:menu)				{ double :menu, :add_dish => nil		}
	let(:chef) 				{ Chef.new(menu)										}
	let(:restaurant) 	{ double :restaurant, :menu => menu }

	it 'has a file source' do
		expect(chef.source).to eq Chef::DEFAULT_FILE
	end

	it 'can read from a csv file' do
		row = double :row;
		expect(CSV).to receive(:foreach).with(Chef::DEFAULT_FILE).and_yield(row)
  	expect(row).to receive(:[]).with(0)
  	expect(row).to receive(:[]).with(1)
  	expect(chef.menu).to receive(:add_dish)
  	chef.load_data_from_file
	end

	it 'can create a menu for a restaurant from file' do
		expect(restaurant).to receive(:menu=)
		chef.create_menu_for(restaurant)
	end
	
end


