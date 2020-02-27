require 'station.rb'

describe Station do

  subject { described_class.new("Aldgate", 1) }

  it "should have a name upon initialization" do
    expect(subject).to have_attributes(name: "Aldgate")
  end

  it "should have a zone upon initialization" do
    expect(subject).to have_attributes(zone: 1)
  end
end
