# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_16_031033) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string "event"
    t.string "sport"
    t.string "games"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "olympian_events", force: :cascade do |t|
    t.bigint "olympian_id", null: false
    t.bigint "event_id", null: false
    t.string "medal"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_olympian_events_on_event_id"
    t.index ["olympian_id"], name: "index_olympian_events_on_olympian_id"
  end

  create_table "olympians", force: :cascade do |t|
    t.string "name"
    t.string "sex"
    t.integer "age"
    t.integer "height"
    t.integer "weight"
    t.string "team"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "olympic_data", force: :cascade do |t|
    t.string "name"
    t.string "sex"
    t.integer "age"
    t.integer "height"
    t.integer "weight"
    t.string "team"
    t.string "games"
    t.string "sport"
    t.string "event"
    t.string "medal"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "olympian_events", "events"
  add_foreign_key "olympian_events", "olympians"
end
