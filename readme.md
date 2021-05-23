# Vending Machine

- [x] Once an item is selected and the appropriate amount of money is inserted, the vending machine should return the correct product
- [ ] The machine should return change if too much money is provided
- [x] The machine should ask for more money if insufficient funds have been inserted
- [x] The machine should take an initial load of products and change
- [x] The change will be of denominations: 1p, 2p, 5p, 10p, 20p, 50p, £1, £2
- [ ] There should be a way of reloading products at a later point
- [ ] There should be a way of reloading change at a later point
- [ ] The machine should keep track of the products and change that it contains

## Testing

- For test run `bundle exec rspec`
- For linting and code analysis run `rubocop`
- To view coverage open `coverage/index.html`

## Three Hour Progress

Sticking to 3 hrs is quite a challenge. At this point I had implemented the vending_machine, cash_handler, inventory and user_interface.

I had an entry point at main.rb which triggered the request for a product selection and requested the appropriate payment for the selected product.

I was trying to work swiftly but probably spent excess time pondering the appropriate data structure for the inventory and cash. I used Struct for coins and products as at this early stage I needed to do no more than access their attributes. I imagine at a later date I may need to be able to amend these attributes eg price and therefore it would be worth extracting as classes in their own right.

With the time pressure I felt I didn't have enough time to adequately distinguish between private and public interfaces. For example product_count and kitty_value shouldn't be accessible by the user of the VendingMachine. If I progressed to the maintenance functions of loading stock and loading cash, I would probably create a new maintenance_manager class who would have access to these more administrative tasks.

## Four Hour Progress

Now the main.rb just initialises the vending machine and sets it running. The run logic is then handled by the VendingMachine class.
A customer can now select and pay for the item and providing they pay the going rate, and they have selected a valid and in-stock item, they can expect to recieve the product. They will not recieve any change yet though so we will have unhappy customers very soon.

### Issues with my code

- My test coverage is not good. Testing `puts` and `gets` methods is troublesome and I decided not to spend my time learning how to do this, preferring to add functionality.
- I am requesting that my customer enters a payment value but I need to implement a coin entry system so I can keep track of total coins and increment them as I make sales.
- I have included a greedy algorythm approach to generating the coins to return as change but haven't 'wired it together' yet.
- I need to add a more graceful way to exit the program than `CTRL C` but I wanted to leave the machine running, ready to accept further vend requests.
- I have not addded maintenance functionality for loading products and coins yet
- I wonder whether a Customer (or Transaction) class may be useful to keep track of the current selection and the coins entered for the vend.
