class RemovePermissonFromDroplets < ActiveRecord::Migration[5.2]
  def up
    remove_column :droplets, :permission
    execute <<-SQL
      DROP TYPE permission_level;
    SQL
  end

  def down
  	execute <<-SQL
      CREATE TYPE permission_level AS ENUM ('personal', 'friends');
    SQL
    add_column :droplets, :permission, :permission_level
  end
end
