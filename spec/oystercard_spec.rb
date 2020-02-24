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

  it "adds value to balance" do
    @mycard.top_up(100.00)
    expect(@mycard.balance).to eq (100.00)
  end

end
