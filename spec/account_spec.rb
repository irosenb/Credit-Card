describe Isaac::Account do
  subject do
    credit_card = Isaac::CreditCard.new(5454545454545454, 2000)
    Isaac::Account.new("Isaac", credit_card)
  end 

  it "has a credit card" do
    expect(subject.card).to be_a(Isaac::CreditCard)
  end

  describe ".charge" do
    it "increases balance" do
      subject.charge(20)
      expect(subject.card.balance).to eq(20)
    end
    
    context "when above limit" do
      it "doesn't charge" do
        expect {subject.charge(10000)}.to_not change {subject.card.balance}
      end
    end
  end

  describe ".credit" do
    it "decreases balance" do
      subject.credit(20)
      expect(subject.card.balance).to eq(-20)
    end
  end

  describe ".save" do
    it "saves to pstore" do
      subject.save
      store = PStore.new("data.pstore")
      expected = store.transaction { store[subject.name] }
      expect(subject.name).to eq("Isaac") 
    end

    context "when property changes" do
      it "saves change" do
        subject.charge(20)
        account = Isaac::Account.retrieve(subject.name)
        expect(account.card.balance).to eq(20)
      end
    end
  end

  describe ".retrieve" do
    it "retrieves object from pstore" do
      store = PStore.new("data.pstore")
      expected = Isaac::Account.retrieve("Isaac")
      expect(subject.name).to eq(expected.name) 
    end
  end
end