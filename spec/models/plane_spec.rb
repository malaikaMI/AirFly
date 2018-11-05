require "rails_helper"

RSpec.describe Plane, type: :model do
  it "has a valid factory" do
    expect(build(:plane)).to be_valid
  end

  let(:plane) { build(:plane) }

  it { expect(plane).to respond_to(:airline) }
end
