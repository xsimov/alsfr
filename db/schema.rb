# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141104134659) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "badges", force: true do |t|
    t.string   "title"
    t.string   "difficulty"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "badges_players", id: false, force: true do |t|
    t.integer "badge_id",  null: false
    t.integer "player_id", null: false
  end

  add_index "badges_players", ["badge_id"], name: "index_badges_players_on_badge_id", using: :btree
  add_index "badges_players", ["player_id"], name: "index_badges_players_on_player_id", using: :btree

  create_table "games", force: true do |t|
    t.string   "title"
    t.string   "game_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location"
    t.string   "owner"
    t.string   "expansions", default: "--- []\n"
  end

  create_table "games_tags", id: false, force: true do |t|
    t.integer "game_id", null: false
    t.integer "tag_id",  null: false
  end

  add_index "games_tags", ["game_id"], name: "index_games_tags_on_game_id", using: :btree
  add_index "games_tags", ["tag_id"], name: "index_games_tags_on_tag_id", using: :btree

  create_table "matches", force: true do |t|
    t.integer  "duration",    default: 0
    t.integer  "game_id"
    t.boolean  "open_status", default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scores", force: true do |t|
    t.integer  "match_id"
    t.integer  "player_id"
    t.integer  "points",     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.string "label"
  end

end
