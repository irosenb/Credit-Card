module Braintree
  class Account
    attr_accessor :name, :card
    
    def initialize(name, card)
      @name = name
      @card = card
    end

    
  end  
end
