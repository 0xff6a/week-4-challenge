class Restaurant

	SECONDS_IN_AN_HOUR = 3600

	attr_accessor :menu, :phone

	def initialize(menu, phone)
		@menu = menu
		@phone = phone
	end

	def send_confirmation_to(customer)
		phone.send_sms(customer.phone_number, confirmation_msg)
	end

	def check_time(offset = 0)
		"#{(Time.new + offset*SECONDS_IN_AN_HOUR).strftime('%H:%M:%S')}"
	end

	def confirmation_msg
		"Thank you for your order. It is now confirmed "\
		"and will be delivered before #{check_time(1)}"
	end

	def raise_error
		raise "Error: price of dishes does not match total"
	end

end