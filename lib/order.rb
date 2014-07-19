class Order

	attr_accessor :items, :total

	def initialize
		@items = {}
		@total = 0.0
	end

	def add(dish, quantity = 1)
		 add_to_items(dish, quantity)
		 update_total_with(dish.price, quantity)
	end

	def add_to_items(dish, quantity)
		items.keys.include?(dish) ? @items[dish] += quantity : @items[dish] = quantity
	end

	def update_total_with(price, quantity)
		@total += price * quantity
	end

	def valid?
		item_total == @total
	end

	def item_total
		result = 0.0
		items.each { |dish, quantity| result += dish.price * quantity }
		result
	end

end