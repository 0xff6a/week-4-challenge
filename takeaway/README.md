OO Implementation of Takeaway Order Management
==============================================

Simplified order management system for takeaways. Functionality is demonstrated in the run.rb script.

Features:
--------
- Menus can be uploaded from csv
- Customer can select items from the menu
- Customer can place an order
- Restaurant can confirm successful orders via SMS

Classes
-------
- Chef: creates a menu for a restaurant using data from a csv file
- Customer: creates orders from a restaurant's menu
- Dish: basic unit of data with a name and a price
- Menu: list of dishes from which orders are generated and which can be displayed
- Order: list of dishes, quantities and a total created by a customer
- Phone: allows a restaurant to send sms confirmations of orders
- Restaurant: receives and confirms customer orders

Running the application:
-----------------------
$ ruby lib/run.rb from ./takeaway

Running the tests:
------------------
$ rspec from ./takeaway