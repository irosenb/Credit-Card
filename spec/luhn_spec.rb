describe Braintree::Luhn do
  subject { Braintree::Luhn.new(4124510136917425) } 

  it "reverses the digits" do
    expect(subject.reverse_digits).to eq(subject.card_number.to_s.reverse)
  end

  it "sums evens" do
    expect(subject.evens_sum([1, 8, 3, 2, 9])).to eq(28)
  end

  it "validates the card" do
    expect(subject.valid?).to be true
  end
end