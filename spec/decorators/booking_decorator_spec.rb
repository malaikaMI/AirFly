require "spec_helper"

describe BookingDecorator do
  let(:past_flight) { create(:flight, :departed) }
  let(:past_booking) { create(:booking, flight: past_flight).decorate }
  let(:booking) { create(:booking).decorate }

  describe "#actions" do
    # it { expect(booking.actions).to have_content("edit") }
    it { expect(past_booking.actions).to eq("") }
  end

  describe "#status" do
    it { expect(booking.status).to eq("Scheduled") }
    it { expect(past_booking.status).to eq("Departed") }
  end

  describe "#departed" do
    it { expect(booking.departed?).to be false }
    it { expect(past_booking.departed?).to be true }
  end
end
