class AddDescriptionToAirport < ActiveRecord::Migration
  def change
    add_column :airports, :description, :text
  end
end
