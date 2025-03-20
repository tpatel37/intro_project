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

ActiveRecord::Schema[7.2].define(version: 2025_03_19_234201) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bus_route_assignments", force: :cascade do |t|
    t.bigint "bus_id", null: false
    t.bigint "bus_route_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bus_id"], name: "index_bus_route_assignments_on_bus_id"
    t.index ["bus_route_id"], name: "index_bus_route_assignments_on_bus_route_id"
  end

  create_table "bus_route_stops", force: :cascade do |t|
    t.bigint "bus_route_id", null: false
    t.bigint "stop_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bus_route_id"], name: "index_bus_route_stops_on_bus_route_id"
    t.index ["stop_id"], name: "index_bus_route_stops_on_stop_id"
  end

  create_table "bus_routes", force: :cascade do |t|
    t.string "name"
    t.string "route_number"
    t.bigint "city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_bus_routes_on_city_id"
  end

  create_table "buses", force: :cascade do |t|
    t.string "license_plate"
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "state"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stops", force: :cascade do |t|
    t.string "name"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bus_route_assignments", "bus_routes"
  add_foreign_key "bus_route_assignments", "buses"
  add_foreign_key "bus_route_stops", "bus_routes"
  add_foreign_key "bus_route_stops", "stops"
  add_foreign_key "bus_routes", "cities"
end
