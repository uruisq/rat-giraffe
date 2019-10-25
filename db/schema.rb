ActiveRecord::Schema.define(version: 20191025023629) do

  create_table "buildings", force: :cascade do |t|
    t.string   "title"
    t.integer  "charge"
    t.string   "address"
    t.integer  "age"
    t.text     "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stations", force: :cascade do |t|
    t.string   "line"
    t.string   "name"
    t.integer  "walk"
    t.integer  "building_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["building_id"], name: "index_stations_on_building_id"
  end

end
