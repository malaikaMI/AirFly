class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :from
      t.integer :to
      t.datetime :departure
      t.datetime :arrival
      t.references :plane

      t.timestamps null: false
    end
  end
end
