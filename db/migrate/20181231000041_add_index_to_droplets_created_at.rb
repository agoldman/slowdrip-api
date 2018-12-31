class AddIndexToDropletsCreatedAt < ActiveRecord::Migration[5.2]
  def change
  	add_index :droplets, :created_at
  end
end
