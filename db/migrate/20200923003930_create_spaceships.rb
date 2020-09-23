class CreateSpaceships < ActiveRecord::Migration
  def change
    create_table :spaceships do |t|
      t.string :name
      t.string :type
      t.string :description
      t.integer :owner_id

      t.timestamps null: false
    end
  end
end
