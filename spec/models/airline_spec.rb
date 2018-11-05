require "rails_helper"

RSpec.describe Airline, type: :model do
  it "has a valid factory" do
    expect(build(:airline)).to be_valid
  end

  let(:airline) { build(:airline) }
  it { expect(airline).to respond_to(:planes) }
  it { expect(airline).not_to respond_to(:plane) }
end
