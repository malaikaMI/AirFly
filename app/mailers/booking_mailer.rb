class BookingMailer < ApplicationMailer
  def success(passenger, booking)
    @booking = booking
    @flight = booking.flight
    @passenger = passenger
    mail(to: passenger.email, subject: "Flight Booking Successful")
  end
end
