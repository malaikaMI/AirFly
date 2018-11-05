require "rails_helper"

RSpec.describe Flight, type: :model do
  it "has a valid factory" do
    expect(build(:flight)).to be_valid
  end

  let(:flight) { create(:flight) }
  let(:valid_params) do
    {
      from: flight.from,
      to: flight.to,
      date: Time.now.tomorrow.tomorrow.to_s
    }
  end
  let(:invalid_params) { { from: flight.from, to: 9, date: Time.now.to_s } }

  it { expect(flight).to respond_to(:bookings) }
  it { expect(flight).to respond_to(:plane) }
  it { expect(flight).to respond_to(:destination) }
  it { expect(flight).to respond_to(:airport) }
  it { expect(flight).to respond_to(:passengers) }

  describe "#available" do
    it { expect(Flight.available).to eq([flight]) }
  end

  describe "#search" do
    it { expect(Flight.search(valid_params)).to eq([flight]) }
    it { expect(Flight.search(invalid_params)).to eq([]) }
    it { expect(Flight.search).to eq([flight]) }
  end
end
