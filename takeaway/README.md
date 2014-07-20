OO Implementation of Takeaway Order Management
==============================================

Created a simplified order management system for takeaways. Functionality is demonstrated in the run.rb script.

Classes
-------
- Chef: creates a menu for a restaurant using data from a csv file
- Customer: creates orders from a restaurant's menu
- Dish: basic unit of data with a name and a price
- Menu: list of dishes from which orders are generated and which can be displayed
- Order: list of dishes, quantities and a total created by a customer
- Phone: allows a restaurant to send sms confirmations of orders
- Restaurant: receives and confirms customer orders