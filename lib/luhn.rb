module Braintree
  class Luhn
    attr_accessor :card_number
    
    def initialize(number)
      @card_number = number
    end

    def valid?
      reversed = reverse_digits.chars.map(&:to_i)
      odds = select_odds(reversed)
      evens = select_evens(reversed)
      sum = odds_sum(odds) + evens_sum(evens) 
      sum % 10 == 0
    end

    def reverse_digits
      @card_number.to_s.reverse
    end

    def select_odds(array)
      array.select.each_with_index { |string, i| i.even? }
    end

    def select_evens(array)
      array.select.each_with_index { |string, i| i.odd? }
    end

    def odds_sum(array)
      array.inject(:+)
    end

    def evens_sum(array)
      doubled = array.map { |n| n * 2 }
      summed_digits = doubled.map { |n| n >= 10 ? n - 9 : n }
      summed_digits.inject(:+)
    end
  end
end