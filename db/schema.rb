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

ActiveRecord::Schema[8.0].define(version: 2025_10_01_151447) do
  create_table "appointments", force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "provider_id", null: false
    t.integer "availability_id", null: false
    t.boolean "cancelled", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["availability_id"], name: "index_appointments_on_availability_id"
    t.index ["client_id"], name: "index_appointments_on_client_id"
    t.index ["provider_id"], name: "index_appointments_on_provider_id"
  end

  create_table "availabilities", force: :cascade do |t|
    t.integer "provider_id", null: false
    t.json "starts_at"
    t.json "ends_at"
    t.string "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slot_id"
    t.index ["provider_id"], name: "index_availabilities_on_provider_id"
    t.index ["slot_id"], name: "index_availabilities_on_slot_id", unique: true
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.date "date_of_birth"
    t.string "gender"
    t.string "occupation"
    t.string "language"
    t.string "ethnicity"
    t.string "religion"
    t.string "email"
    t.string "phone"
    t.string "address"
    t.string "apartment"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_clients_on_email", unique: true
  end

  create_table "providers", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.date "date_of_birth"
    t.string "gender"
    t.string "occupation"
    t.string "language"
    t.string "ethnicity"
    t.string "religion"
    t.string "email"
    t.string "phone"
    t.string "address"
    t.string "apartment"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_providers_on_email", unique: true
  end

  add_foreign_key "appointments", "availabilities"
  add_foreign_key "appointments", "clients"
  add_foreign_key "appointments", "providers"
  add_foreign_key "availabilities", "providers"
end
