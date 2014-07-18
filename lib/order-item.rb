class OrderItem

	attr_accessor :quantity, :dish

	def initialize
		@quantity = 0
		@dish = nil
	end

	def add(dish, quantity = 1)
		@dish = dish
		@quantity += quantity
	end
	
end