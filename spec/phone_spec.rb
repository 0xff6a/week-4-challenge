require 'phone'

describe Phone do

	let(:phone) {Phone.new}
	let(:my_number) { '+447852349285'}

	it 'should have a default number' do
		my_number = Phone::DEFAULT_NUMBER
		expect(phone.number).to eq my_number
	end

	it 'can be given another number' do
		expect(Phone.new(my_number).number).to eq my_number
	end

	it 'can send an sms to another number' do
		msg = "Hi"; client = double :client, :account => nil
		expect(phone).to receive(:initialize_twilio_client)
		expect(phone).to receive(:create_new_twilio_msg).with(my_number, msg)
		phone.send_sms(my_number, msg)
	end

end