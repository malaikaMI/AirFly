class AddIataAndIcaoToAirlines < ActiveRecord::Migration
  def change
    add_column :airlines, :iata, :string
    add_column :airlines, :icao, :string
  end
end
