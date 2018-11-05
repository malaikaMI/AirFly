class AddIcaoAndIataToAirport < ActiveRecord::Migration
  def change
    add_column :airports, :icao, :string
    add_column :airports, :iata, :string
  end
end
