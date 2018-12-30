class CreateDroplets < ActiveRecord::Migration[5.2]
  def change
    create_table :droplets do |t|
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
