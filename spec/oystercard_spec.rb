require 'oystercard'

describe Oystercard do 
  before (:each) do
    @mycard = Oystercard.new
  end

  it "has balance" do 
    expect(@mycard.balance).to be (0.00)
  end

  it {is_expected.to respond_to(:top_up).with(1).argument }

  # experiment with new syntax
  it "changes the balance variable" do
    expect {@mycard.top_up(50.00)}.to change(@mycard, :balance)
  end

  describe "#top_up" do
    it "adds value to balance" do
      @mycard.top_up(80.00)
      expect(@mycard.balance).to eq (80.00)
    end

    it "raises an error if top up brings balance over £90" do
      expect{ @mycard.top_up(95.00) }.to raise_error(@limit_error)
    end
  end

  describe "#deduct" do
    before (:each) do
      @mycard.top_up(10.00)
    end

    it "reduces balance by a given amount; 'fare'" do
      @mycard.deduct(5.50)
      expect(@mycard.balance).to eq (4.50)
    end
  end

  describe "#in_journey?" do
    it "returns 'false' or 'true' depending on current card status" do
    # assume default status is 'false'??
    expect(subject).not_to be_in_journey
    end
  end

  describe "#touch_in" do
    it "can touch-in" do
      subject.touch_in
      expect(subject).to be_in_journey
    end
  end

end
