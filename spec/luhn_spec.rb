require 'spec_helper' 

describe Braintree::Luhn do
  subject { Braintree::Luhn.new(49927398716) } 

  it "reverses the digits" do
    expect(subject.reverse_digits).to eq(subject.card_number.to_s.reverse)
  end

  it "validates the card" do
    expect(subject.valid?).to eq(true) 
  end
end