require "rails_helper"

RSpec.describe Airport, type: :model do
  it "has a valid factory" do
    expect(build(:airport)).to be_valid
  end

  let(:airport) { build(:airport) }

  it { expect(airport).to respond_to(:city) }
  it { expect(airport.city).to be_a(City) }
end
