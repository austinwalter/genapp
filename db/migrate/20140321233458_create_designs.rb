class CreateDesigns < ActiveRecord::Migration
  def change
    create_table :designs do |t|
      t.integer :user_id

      t.timestamps
    end
    add_index :designs, [:user_id, :created_at]
  end
end
