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

ActiveRecord::Schema[7.1].define(version: 2023_11_14_113854) do
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

  create_table "feeds_users", id: false, force: :cascade do |t|
    t.integer "feed_id", null: false
    t.integer "user_id", null: false
    t.index ["feed_id", "user_id"], name: "index_feeds_users_on_feed_id_and_user_id"
    t.index ["user_id", "feed_id"], name: "index_feeds_users_on_user_id_and_feed_id"
  end

  create_table "listens", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "episode_id", null: false
    t.integer "play_count", default: 0
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["episode_id"], name: "index_listens_on_episode_id"
    t.index ["user_id"], name: "index_listens_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "episodes", "feeds"
  add_foreign_key "listens", "episodes"
  add_foreign_key "listens", "users"
end
