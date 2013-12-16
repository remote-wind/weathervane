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

ActiveRecord::Schema.define(version: 20131215235900) do

  create_table "forecast_providers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "forecast_providers", ["name"], name: "index_forecast_providers_on_name", unique: true

  create_table "forecasts", force: true do |t|
    t.datetime "valid_from"
    t.datetime "valid_until"
    t.datetime "reference_time"
    t.string   "forecast_provider_name"
    t.float    "latitude"
    t.float    "longitude"
    t.float    "wind_direction"
    t.float    "wind_speed"
    t.float    "wind_gust"
    t.integer  "forecast_provider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "forecasts", ["forecast_provider_id"], name: "index_forecasts_on_forecast_provider_id"
  add_index "forecasts", ["forecast_provider_name"], name: "index_forecasts_on_forecast_provider_name"

end
