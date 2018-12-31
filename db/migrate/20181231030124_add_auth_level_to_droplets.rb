class AddAuthLevelToDroplets < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TYPE permission_level AS ENUM ('personal', 'friends');
    SQL
    add_column :droplets, :permission, :permission_level
  end

  def down
    remove_column :droplets, :permission
    execute <<-SQL
      DROP TYPE permission_level;
    SQL
  end
end
