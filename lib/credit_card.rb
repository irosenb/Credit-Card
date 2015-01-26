module Braintree
  class CreditCard
    attr_accessor :balance
    attr_reader :number, :limit
    attr_reader :valid

    def initialize(card_number, limit)
      @number = card_number
      @limit = limit
      @balance = 0
      @valid = Luhn.new(@number).valid?
    end

    def balance=(value)
      @balance = value if value < @limit && @valid
    end
  end
end
