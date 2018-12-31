class AddDefaultToDropletPermission < ActiveRecord::Migration[5.2]
  def up
    change_column :droplets, :permission, :permission_level, default: 'personal'
  end

  def down
    change_column :droplets, :permission, :permission_level, default: nil
  end
end
