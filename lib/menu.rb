require 'terminal-table'

class Menu

	attr_reader :dishes

	def initialize
		@dishes = []
	end

	def add_dish(dish)
		@dishes << dish
	end

	def display
		puts "-------------MENU-------------"
		@dishes.each do |dish|
			puts "#{dish.name}: #{dish.price}"
		end
		puts "------------------------------"
	end

end