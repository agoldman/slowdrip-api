class AddContentColumnToDropletsTable < ActiveRecord::Migration[5.2]
  def change
  	add_column :droplets, :content, :string, :limit => 300
  end
end
