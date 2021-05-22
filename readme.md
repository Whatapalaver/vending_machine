# Vending Machine

- [ ] Once an item is selected and the appropriate amount of money is inserted, the vending machine should return the correct product
- [ ] The machine should return change if too much money is provided
- [ ] The machine should ask for more money if insufficient funds have been inserted
- [x] The machine should take an initial load of products and change
- [x] The change will be of denominations: 1p, 2p, 5p, 10p, 20p, 50p, £1, £2
- [ ] There should be a way of reloading products at a later point
- [ ] There should be a way of reloading change at a later point
- [ ] The machine should keep track of the products and change that it contains

## Testing

- For test run `bundle exec rspec`
- For linting and code analysis run `rubocop`


## Three Hour Progress

Sticking to 3 hrs is quite a challenge. At this point I had implemented the vending_machine, cash_handler, inventory and user_interface.

I had an entry point at main.rb which triggered the request for a product selection and requested the appropriate payment for the selected product.

I was trying to work swiftly but probably spent excess time pondering the appropriate data structure for the inventory and cash. I used Struct for coins and products as at this early stage I needed to do no more than access their attributes. I imagine at a later date I may need to be able to amend these attributes eg price and therefore it would be worth extracting as classes in their own right.

With the time pressure I felt I didn't have enough time to adequately distinguish between private and public interfaces. For example product_count and kitty_value shouldn't be accessible by the user of the VendingMachine. If I progressed to the maintenance functions of loading stock and loading cash, I would probably create a new maintenance_manager class who would have access to these more administrative tasks.
