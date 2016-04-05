require_relative "lib/errors"
require_relative "lib/customer"
require_relative "lib/product"
require_relative "lib/transaction"


# PRODUCTS

Product.new(title: "LEGO Iron Man vs. Ultron", price: 22.99, stock: 55, brand: "LEGO")
Product.new(title: "Nano Block Empire State Building", price: 49.99, stock: 12, brand: "Nano Block")
Product.new(title: "LEGO Firehouse Headquarter", price: 199.99, stock: 0,brand: "LEGO")


puts Product.all.count # Should return 3 

#Product.new(title: "LEGO Iron Man vs. Ultron", price: 22.99, stock: 55)
# Should return DuplicateProductError: 'LEGO Iron Man vs. Ultron' already exists.

nanoblock = Product.find_by_title("Nano Block Empire State Building")
firehouse = Product.find_by_title("LEGO Firehouse Headquarter")


puts nanoblock.title # Should return 'Nano Block Empire State Building'
puts nanoblock.price # Should return 49.99
puts nanoblock.stock # Should return 12
puts nanoblock.in_stock? # Should return true
puts firehouse.in_stock? # Should return false

products_in_stock = Product.in_stock
# Should return an array of all products with a stock greater than zero

puts products_in_stock.include?(nanoblock) # Should return true
puts products_in_stock.include?(firehouse) # Should return false

# CUSTOMERS

Customer.new(name: "Walter Latimer")
Customer.new(name: "Julia Van Cleve")

puts Customer.all.count # Should return 2

# Customer.new(name: "Walter Latimer")
# Should return DuplicateCustomerError: 'Walter Latimer' already exists.

walter = Customer.find_by_name("Walter Latimer")

puts walter.name # Should return "Walter Latimer"


# TRANSACTIONS

transaction = Transaction.new(walter, nanoblock)

puts transaction.id # Should return 1
puts transaction.product == nanoblock # Should return true
puts transaction.product == firehouse # Should return false
puts transaction.customer == walter # Should return true

puts nanoblock.stock # Should return 11 

# PURCHASES

puts walter.purchase(nanoblock)

puts Transaction.all.count # Should return 2 
transaction2 = Transaction.find(2)
puts transaction2.product == nanoblock # Should return true


#walter.purchase(firehouse)
# Should return OutOfStockError: 'LEGO Firehouse Headquarter' is out of stock.

puts
puts "Additional features"

# Adding new products and adding brand 

crazyman = Product.new(title: "Crazyman", price: 15.00, stock: 2, brand: "Matell")
puts crazyman.title  #return crazyman
puts crazyman.price #should return 15.00

