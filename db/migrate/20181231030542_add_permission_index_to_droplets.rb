class AddPermissionIndexToDroplets < ActiveRecord::Migration[5.2]
  def change
    add_index :droplets, :permission
  end
end
