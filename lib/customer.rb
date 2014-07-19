require './lib/dish'

class Customer

	DEFAULT_NUMBER = '+447852349285'

	attr_reader	:phone_number
	attr_accessor :order

	def initialize(phone_number= DEFAULT_NUMBER)
		@phone_number = phone_number
		@order = nil
	end

	def create_order_from(menu, new_order)
		@order = new_order
		menu.display
		add_items_to_order
	end

	def send_order_to(restaurant)
		restaurant.receive_order(customer.order, customer)
	end

	def add_items_to_order
		print_select_item_msg
		loop do
			dish = select_dish
			break if dish.empty?
			quantity = select_quantity
			@order.add(Dish.new(dish, quantity))
		end
	end

	def select_item
			print_select_item_msg
			[select_dish, select_quantity]
	end

	def select_dish
		print_select_dish_msg
		get_input
	end

	def select_quantity
		print_update_quantity_msg
		get_input.to_f
	end

	def print_select_item_msg
		puts "Item selection - hit enter twice to finish"
	end

	def print_select_dish_msg
		puts "Please select a dish"
	end

	def print_update_quantity_msg
		puts "How many would you like?"
	end

	def get_input(input = STDIN)
		input.gets.chomp
	end

	def customer
		self
	end

end