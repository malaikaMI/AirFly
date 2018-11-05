require "rails_helper"

RSpec.describe Country, type: :model do
  it "has a valid factory" do
    expect(build(:country)).to be_valid
  end

  let(:country) { build(:country) }

  it { expect(country).to respond_to(:states) }
end
