class CreateEquipment < ActiveRecord::Migration[6.1]
  def change
    create_table :equipment do |t|
      t.string :item_name
      t.integer :stat
      t.boolean :positive

      t.integer :character_id
    end
  end
end
