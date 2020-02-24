require 'oystercard'

describe Oystercard do 
  before (:each) do
    @mycard = Oystercard.new
  end

  it "has balance" do 
    expect(@mycard.balance).to be (0.00)
  end

end
