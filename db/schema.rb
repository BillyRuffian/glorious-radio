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

ActiveRecord::Schema[7.1].define(version: 2023_11_03_132248) do
  create_table "episodes", force: :cascade do |t|
    t.integer "feed_id", null: false
    t.string "title"
    t.string "duration"
    t.datetime "published_at"
    t.text "description"
    t.string "mimetype"
    t.string "url"
    t.integer "bytes"
    t.string "guid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feed_id"], name: "index_episodes_on_feed_id"
    t.index ["url"], name: "index_episodes_on_url"
  end

  create_table "feeds", force: :cascade do |t|
    t.string "url"
    t.string "name"
    t.text "description"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_feeds_on_name"
    t.index ["url"], name: "index_feeds_on_url"
  end

  add_foreign_key "episodes", "feeds"
end
