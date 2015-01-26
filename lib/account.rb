module Braintree
  class Account
    attr_accessor :name, :card

    def initialize(name, card)
      @name = name
      @card = card
      save
    end

    def charge(amount)
      @card.balance += amount
      save 
    end
    
    def credit(amount)
      @card.balance -= amount
      save
    end

    def save
      store = PStore.new("data.pstore")
      store.transaction { store[self.name] = self }
    end

    def self.retrieve(name)
      store = PStore.new("data.pstore")
      store.transaction { store[name] }
    end
  end
end
