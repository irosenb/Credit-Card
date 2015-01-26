describe Braintree::CreditCard do
  subject { Braintree::CreditCard.new(5454545454545454, 2000) } 
  
  it "should initialize" do
    expect(subject.number).to_not be_nil
  end

  describe "charge" do
    it "increases balance" do
      subject.balance += 20
      expect(subject.balance).to eq(20) 
    end

    it "won't increase above limit" do
      subject.balance += 10000
      expect(subject.balance).to eq(0)
    end
  end

  describe "credit" do
    it "decreases balance" do
      subject.balance -= 20
      expect(subject.balance).to eq(-20) 
    end
  end
end