class AddStateIdToCity < ActiveRecord::Migration
  def change
    add_reference :cities, :state, index: true, foreign_key: true
  end
end
