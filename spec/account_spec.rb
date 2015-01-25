describe Braintree::Account do
  subject do
    credit_card = Braintree::CreditCard.new(5454545454545454, 2000)
    Braintree::Account.new("Isaac", credit_card)
  end 

  it "has a credit card" do
    expect(subject.card).to be_a(Braintree::CreditCard)
  end
  
end