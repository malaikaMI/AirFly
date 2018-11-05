class AddBookingsToPassenger < ActiveRecord::Migration
  def change
    add_reference :passengers, :booking, index: true, foreign_key: true
  end
end
