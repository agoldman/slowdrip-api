class AddTimeZoneTimestampToDropletsTable < ActiveRecord::Migration[5.2]
  def change
  	remove_column :droplets, :created_at
  	remove_column :droplets, :updated_at
  	add_column :droplets, :created_at, :timestamptz, null: false
  	add_column :droplets, :updated_at, :timestamptz, null: false
  end
end
