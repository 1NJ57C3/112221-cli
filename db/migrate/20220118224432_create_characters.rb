class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :str
      t.integer :int
      t.integer :wis
      t.integer :dex
      t.integer :chr
      t.integer :lck
      t.integer :vit
      
      # ! tis the actual association
      t.integer :user_id
    end
  end
end
