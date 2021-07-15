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

ActiveRecord::Schema.define(version: 2021_07_15_161411) do

  create_table "edges", force: :cascade do |t|
    t.integer "cost"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "source_id", null: false
    t.integer "target_id", null: false
    t.index ["source_id"], name: "index_edges_on_source_id"
    t.index ["target_id"], name: "index_edges_on_target_id"
  end

  create_table "metro_networks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stations", force: :cascade do |t|
    t.string "name"
    t.integer "color"
    t.integer "status"
    t.integer "distance_from_source"
    t.integer "metro_network_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["metro_network_id"], name: "index_stations_on_metro_network_id"
  end

  add_foreign_key "edges", "stations", column: "source_id"
  add_foreign_key "edges", "stations", column: "target_id"
  add_foreign_key "stations", "metro_networks"
end
