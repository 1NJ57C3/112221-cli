class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :str
      t.string :int
      t.string :wis
      t.string :dex
      t.string :chr
      t.string :lck
      t.string :vit
      
      # ! tis the actual association
      t.integer :user_id
    end
  end
end
