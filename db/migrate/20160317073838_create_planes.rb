class CreatePlanes < ActiveRecord::Migration
  def change
    create_table :planes do |t|
      t.string :name
      t.string :code
      t.integer :capacity
      t.integer :airline_id

      t.timestamps null: false
    end
  end
end
