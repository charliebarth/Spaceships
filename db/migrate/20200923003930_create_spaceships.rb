class CreateSpaceships < ActiveRecord::Migration
  def change
    create_table :spaceships do |t|
      t.string :name
      t.string :ship_type
      t.string :description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
