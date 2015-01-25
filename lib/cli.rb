require "thor" 

module Braintree
  class CLI < Thor
    package_name "CardProcess"

    desc "add NAME, CARD #, LIMIT", "Creates a new credit card for a given name, card number, and limit"
    def add(name, card_number, limit)
      
    end

    desc "charge NAME, AMOUNT", "Increases the balance of the card associated with the provided name by the amount specified"
    def charge(name, amount)
      
    end

  end  
end

Braintree::CLI.start(ARGV)