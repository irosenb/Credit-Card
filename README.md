# Braintree

My implementation of the Braintree problem. 

I've divided the program into a few parts. I have the Luhn 10 Algorithm class, the Account class, the Balance class, and the Action class. 

## Luhn 10 Algorithm 

The Luhn 10 Algorithm is a formula used to validate identification numbers like credit card numbers. Here I implemented the formula in several steps. I opted for readability over speed. These algorithms can be confusing, and I strived to make the class read almost like a poem rather than a complicated algorithm. 

I divided the algorithm into 6 different methods. I wanted to keep the class as DRY as possible. Half of the methods handle the even digits, while the rest handle the odd digits. Handling the even digits is more complex than the odd digits, and I wanted to make that differentiation very clear. 

## Account

The Account class integrates all the different classes into one centralized system. 