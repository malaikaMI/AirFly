require "rails_helper"

RSpec.describe Booking, type: :model do
  it "has a valid factory" do
    expect(build(:booking)).to be_valid
  end

  let(:booking) { build(:booking) }

  it { expect(booking).to respond_to(:flight) }
  it { expect(booking).to respond_to(:passengers) }
  it { expect(booking.flight).to be_a(Flight) }

  let(:saved_booking) { create(:booking) }
  let(:params) { { code: booking.code } }
  let(:invalid_params) { { code: 2 } }

  describe "#search" do
    let(:booking) { create(:booking) }
    let(:params) { { code: booking.code } }
    it { expect(Booking.search(params)).to eq(booking) }
    it { expect(Booking.search(invalid_params)).to be nil }
  end

  describe "#get_code" do
    it { expect(booking.get_code.length).to eq(8) }
  end

  describe "#available?" do
    it { expect(booking.available?).to eq true }
  end
end
