require 'oystercard'

describe Oystercard do
  before (:each) do
    @mycard = Oystercard.new
  end

  let (:station) {double :station}

  it "has balance" do
    expect(@mycard.balance).to be (0.00)
  end

  it "has an empty journey array upon initialization" do
    expect(@mycard).to have_attributes(journey_list: [])
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
      expect{ @mycard.top_up(95.00) }.to raise_error(@max_limit_error)
    end
  end

  describe "#deduct" do
    before (:each) do
      @mycard.top_up(10.00)
    end

    it "reduces balance by a given amount; 'fare'" do
      @mycard.send(:deduct,5.50)
      expect(@mycard.balance).to eq (4.50)
    end
  end

  describe "#in_journey?" do
    it "returns 'false' or 'true' depending on current card status" do
    expect(subject).not_to be_in_journey
    end
  end

  describe "#touch_in" do
    before(:each) do
      @mycard.instance_variable_set(:@balance, 5.00)
    end

    it "can touch-in" do
      @mycard.touch_in(station)
      expect(@mycard).to be_in_journey
    end

    it "raises an error if card has less than one pound at touch in" do
      @mycard.instance_variable_set(:@balance, 0.50)
      expect{ @mycard.touch_in(station) }.to raise_error(@min_limit_error)
    end

    it "knows what station the journey started at" do
      # expect(@mycard.touch_in(station)).to eq station
      expect(@mycard.touch_in(station)).to eq ({station => nil})
    end
  end

  describe "#touch_out" do
    before(:each) do
      @mycard.instance_variable_set(:@balance, 5.00)
    end

    it "allows to touch out" do
      # station = double(station)
      @mycard.touch_in(station)
      @mycard.touch_out(station)
      expect(@mycard).not_to be_in_journey
    end

    it "reduces balance by 1.00" do
      expect {@mycard.touch_out(station)}.to change{@mycard.balance}.by(-1.00)
    end

    it "stores the just-comp[leted journey upon touching out" do
      @mycard.touch_in(station)
      @mycard.touch_out(station)
      expect(@mycard).to have_attributes(journey: {station => station})
    end
  end




end
