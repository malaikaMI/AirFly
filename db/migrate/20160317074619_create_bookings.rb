class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :flight
      t.references :passenger

      t.timestamps null: false
    end
  end
end
