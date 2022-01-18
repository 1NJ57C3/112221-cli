# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_18_224439) do

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.integer "str"
    t.integer "int"
    t.integer "wis"
    t.integer "dex"
    t.integer "chr"
    t.integer "lck"
    t.integer "vit"
    t.integer "user_id"
  end

  create_table "equipment", force: :cascade do |t|
    t.string "item_name"
    t.integer "stat"
    t.boolean "positive"
    t.integer "character_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
  end

end
