class CreatePassengers < ActiveRecord::Migration
  def change
    create_table :passengers do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :address

      t.timestamps null: false
    end
  end
end
