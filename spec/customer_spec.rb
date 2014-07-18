require 'customer'

describe Customer do

	let(:number)		{	'+447852349285'								}
	let(:customer) 	{ Customer.new(number) 					}

	it 'should have a phone number' do
		expect(customer.phone_number).to be number
	end


end

