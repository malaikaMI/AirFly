class CreateAirports < ActiveRecord::Migration
  def change
    create_table :airports do |t|
      t.string :name
      t.integer :city_id
      t.string :email
      t.string :phone

      t.timestamps null: false
    end
  end
end
