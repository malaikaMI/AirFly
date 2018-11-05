class AddDepartureDateToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :departure_date, :date
  end
end
