class Customer

	attr_reader	:phone_number
	attr_accessor :order

	def initialize(phone_number)
		@phone_number = phone_number
		@order = nil
	end

	def create_order(new_order, items = {})
		@order = new_order
		add_items_to_order(items)
	end

	def add_items_to_order(items)
		items.each do |dish, quantity|
			@order.add(dish, quantity) 
		end 
	end

	def select_item
			print_select_item_msg
			Hash[select_dish, select_quantity]
	end

	def select_dish
		print_select_dish_msg
		get_input
	end

	def select_quantity
		print_update_quantity_msg
		get_input
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

end