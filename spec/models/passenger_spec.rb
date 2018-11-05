require "rails_helper"

RSpec.describe Passenger, type: :model do
  it "has a valid factory" do
    expect(build(:passenger)).to be_valid
  end

  let(:passenger) { build(:passenger) }

  it { expect(passenger).to respond_to(:booking) }
end
