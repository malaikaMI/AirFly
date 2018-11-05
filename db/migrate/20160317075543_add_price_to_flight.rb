class AddPriceToFlight < ActiveRecord::Migration
  def change
    add_column :flights, :price, :decimal
  end
end
