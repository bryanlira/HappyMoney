# RubyHappyMoney - HappyMoney 

### Features

- Provides a `HappyMoney::Money` class which encapsulates all information about an certain
  amount of money, such as its amount and its currency.
- Provides a `HappyMoney::Currency` class which encapsulates all information about
  a monetary unit.
- Provides with arithmetic and comparison operations such as / * - + > <
 
### Installation
 
First of all you need to download the engine and add it to an existence project with the following command. The path is the location where the engine is located: 

    gem 'happy_money', path: '../../Desktop/happy_money'

After that, execute the next command to import the migrations to your project

    rake happy_money:install:migrations   
    
Then, run the migration command, so you can start using the HappyMoney engine :D

    rake db:migrate
    
### Run Rspec Tests
 
To run the Rspec tests, you should be on the engine path

    [~/Desktop/happy_money]$     

Then, follow the next commands to create the test database:

    rake db:create RAILS_ENV=test 
    rake db:migrate RAILS_ENV=test
     
Finally, you will be able to run the Rspec tests by using this command:
      
    bundle exec rspec  
    
### Note
    
This engine consumes a web service to perform the currency conversion (http://free.currencyconverterapi.com), which affects the results of the tests and of the given examples.

### Usage
 
 ``` ruby
 #Instantiate money objects:
  
 fifty_eur = HappyMoney::Money.new(50, 'EUR')
 
 # Get amount and currency:
  
 fifty_eur.amount   # => 50
 fifty_eur.currency # => "EUR"
 fifty_eur.inspect  # => "50.00 EUR"
 
 # Convert to a different currency (Returns a new object with this monetary amount and its currency):
 # The supported currencies are: USD, EUR, MEX
  
 fifty_eur.convert_to('USD') # => 55.50 USD
 
 # Perform operations in different currencies:
  
 twenty_dollars = HappyMoney::Money.new(20, 'USD')
 
 # Arithmetics:
  
 fifty_eur + twenty_dollars # => 68.02 EUR
 fifty_eur - twenty_dollars # => 31.98 EUR
 fifty_eur / 2              # => 25 EUR
 twenty_dollars * 3         # => 60 USD
 
 # Comparisons (also in different currencies):
  
 twenty_dollars == HappyMoney::Money.new(20, 'USD') # => true
 twenty_dollars == HappyMoney::Money.new(30, 'USD') # => false
  
 fifty_eur_in_usd = fifty_eur.convert_to('USD')
 fifty_eur_in_usd == fifty_eur          # => true
  
 twenty_dollars > HappyMoney::Money.new(5, 'USD')   # => true
 twenty_dollars < fifty_eur             # => true
 ```