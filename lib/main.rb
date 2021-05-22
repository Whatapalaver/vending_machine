require_relative 'vending_machine'
require_relative 'user_interface'

machine = VendingMachine.new

selection = machine.initiate_transaction
selected_product = machine.find_product(selection)
payment = machine.request_payment(selected_product)
puts payment
