require "rails_helper"

RSpec.describe State, type: :model do
  it "has a valid factory" do
    expect(build(:state)).to be_valid
  end

  let(:state) { build(:state) }

  it { expect(state).to respond_to(:cities) }
end
