class AddCallsignToAirlines < ActiveRecord::Migration
  def change
    add_column :airlines, :callsign, :string
  end
end
