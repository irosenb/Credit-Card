# Braintree

My implementation of the Braintree problem. 

## Usage

`cd` into the `braintree` directory. Then run `ruby bin/cli -h`. This will show all the commands available to you:

- `add NAME CARD_NUMBER LIMIT`: Creates a new credit card for a given name, card number, and limit
- `charge NAME AMOUNT`: Increases the balance of the card associated with the provided name by the amount specified
- `credit NAME AMOUNT`: Decreases the balance of the card associated with the provided name by the amount specified

Example: If you want to add a person, run `ruby bin/cli add NAME CARD_NUMBER LIMIT`, with name being the name of the person, card number being the credit card #, and the limit being the limit on the credit card. 

To run the tests, run `rspec` in the terminal within the directory. All tests should pass.

# Implementation

I've divided the program into a few parts. I have the Luhn 10 Algorithm class, the Account class, and the CreditCard class.

## Luhn 10 Algorithm 

The Luhn 10 Algorithm is a formula used to validate identification numbers like credit card numbers. Here I implemented the formula in several steps. I opted for readability over speed. These algorithms can be confusing, and I strived to make the class read almost like a poem rather than a complicated algorithm. 

I divided the algorithm into 6 different methods. I wanted to keep the class as DRY as possible. Half of the methods handle the even digits, while the rest handle the odd digits. Handling the even digits is more complex than the odd digits, and I wanted to make that differentiation very clear. 

## Account

The Account class integrates all the different classes into one centralized system. It also manages persisting and retrieving accounts from storage. After trying to keep the persistence code in the CLI file, I decided to move that code to the `Account` class, making the CLI file much easier to read. 

## CreditCard

The `CreditCard` class stores all the credit card information. It validates the credit card using the `Luhn` class, manages the balance & prevents balance from going over the card limit. 

## CLI

The `CLI` class manages the command line interface, with which one interacts wtih the program. I kept all user facing code here, like the summary code. I thought of storing that code in the `Account` class instead, but I felt that moving that code would bloat the Account class. If someone wanted to just use the Account class, they would have a hard time with the CLI code being there. 

## Ruby

I chose Ruby to solve this because it's the language I am most familiar with. I prefer Ruby over other languages for its expressiveness & beauty. Writing this program made me happy, one of the stated goals of Ruby. 

