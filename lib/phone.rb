require 'twilio-ruby'

class Phone

	DEFAULT_NUMBER = '+441539234045'
	ACCOUNT_SID = 'ACe64ef03366d02dab54a00906e91c73c2' 
	AUTH_TOKEN = '65f71c1911468212140ef06343fd7985'

	attr_accessor :number

	def initialize(number = DEFAULT_NUMBER)
		@number = number
	end

	def send_sms(customer_number, message_body)
		initialize_twilio_client
		create_new_twilio_msg(customer_number, message_body)
	end

	def initialize_twilio_client
		@client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
	end
			
	def create_new_twilio_msg(customer_number, message_body)
		@client.account.messages.create({
			:from => DEFAULT_NUMBER, 
			:to => customer_number,
			:body => message_body
		})
	end

end