require './lib/chef'
require './lib/customer'
require './lib/menu'
require './lib/order'
require './lib/phone'
require './lib/restaurant'

#Create a new chef with a menu
michel_roux = Chef.new(Menu.new)
#Create a new restaurant with a phone
funny_foods = Restaurant.new(Phone.new)
#Chef creates the menu for the restaurant
michel_roux.create_menu_for(funny_foods)
#Create a new customer with the default phone number(mine)
fatty = Customer.new
#Get the customer to order from the restaurant
fatty.create_order_from(funny_foods.menu, Order.new)
#Get the customer to try and scam the restaurant
fatty.order.total = 1.5
begin
#Get the customer to send the order to the restaurant
fatty.send_order_to(funny_foods)
#Rescue the error
rescue RuntimeError => error
	puts error.message
end
#Try again
fatty.create_order_from(funny_foods.menu, Order.new)
fatty.send_order_to(funny_foods)