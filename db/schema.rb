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

ActiveRecord::Schema.define(version: 2021_10_26_213327) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "signatures", force: :cascade do |t|
    t.string "username", null: false
    t.string "api_key", null: false
    t.string "static_signature", null: false
    t.string "background_color", default: "#ffffff", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["api_key"], name: "index_signatures_on_api_key", unique: true
    t.index ["username"], name: "index_signatures_on_username", unique: true
  end

end
