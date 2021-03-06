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

ActiveRecord::Schema.define(version: 20170220003341) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string   "player_name"
    t.string   "name"
    t.integer  "hit_points"
    t.integer  "base_initiative"
    t.string   "race"
    t.string   "character_class"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_characters_on_user_id", using: :btree
  end

  create_table "combat_scenario_characters", force: :cascade do |t|
    t.integer  "character_id"
    t.integer  "combat_scenario_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["character_id"], name: "index_combat_scenario_characters_on_character_id", using: :btree
    t.index ["combat_scenario_id"], name: "index_combat_scenario_characters_on_combat_scenario_id", using: :btree
  end

  create_table "combat_scenarios", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_combat_scenarios_on_user_id", using: :btree
  end

  create_table "creatures", force: :cascade do |t|
    t.string   "name"
    t.string   "creature_name"
    t.integer  "count"
    t.string   "creature_type"
    t.integer  "hit_points"
    t.string   "traits"
    t.integer  "initiative",         default: 0
    t.integer  "combat_scenario_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "will_save"
    t.integer  "fortitude_save"
    t.integer  "reflex_save"
    t.boolean  "alive",              default: true
    t.integer  "perception"
    t.integer  "base_initiative"
    t.index ["combat_scenario_id"], name: "index_creatures_on_combat_scenario_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "role",            default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_foreign_key "characters", "users"
  add_foreign_key "combat_scenario_characters", "characters"
  add_foreign_key "combat_scenario_characters", "combat_scenarios"
  add_foreign_key "combat_scenarios", "users"
  add_foreign_key "creatures", "combat_scenarios"
end
