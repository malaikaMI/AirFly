require "rails_helper"

RSpec.describe City, type: :model do
  it "has a valid factory" do
    expect(build(:city)).to be_valid
  end

  let(:city) { build(:city) }

  it { expect(city).to respond_to(:airports) }
  it { expect(city).to respond_to(:state) }
  it { expect(city.state).to be_a(State) }
end
