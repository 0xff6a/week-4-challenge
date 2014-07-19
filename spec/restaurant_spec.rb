require 'restaurant'

describe Restaurant do

	let(:menu)				{ double :menu																													}
	let(:phone)				{ double :phone																													}
	let(:restaurant) 	{ Restaurant.new(menu, phone) 																					}
	let(:customer)		{ double :customer,	:phone_number	=>	123																}
	let(:time)				{ "#{(Time.new + Restaurant::SECONDS_IN_AN_HOUR).strftime('%H:%M:%S')}"	}	
	let(:msg)					{ "Thank you for your order. It is now confirmed "\
											"and will be delivered before #{time}"																}
	
	it 'should have a menu' do
		expect(restaurant.menu).to be menu
	end

	it 'should have a phone' do
		expect(restaurant.phone).to be phone
	end

	it 'should have no order initialy' do

	end

	it 'should print the time' do
		expect(restaurant.check_time).to eq Time.new.strftime('%H:%M:%S')
	end

	it 'should print a confirmation message' do
		expect(restaurant.confirmation_msg).to eq msg
	end

	it 'should send a text confirmation of an order' do
		expect(phone).to receive(:send_sms).with(123, msg)
		restaurant.send_confirmation_to(customer)
	end	

	it 'should raise an error on receiving an incorrect order' do
		expect { restaurant.raise_error }.to raise_error(RuntimeError)
	end
	
end