class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.decimal :price
      t.references :airline, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
