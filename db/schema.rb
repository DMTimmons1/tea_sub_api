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

ActiveRecord::Schema[7.0].define(version: 2023_05_31_194537) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "customers_id"
    t.string "title"
    t.integer "price"
    t.string "status"
    t.string "frequencey"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customers_id"], name: "index_subscriptions_on_customers_id"
  end

  create_table "teas", force: :cascade do |t|
    t.bigint "subscriptions_id"
    t.string "title"
    t.string "description"
    t.string "temperature"
    t.string "brew_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subscriptions_id"], name: "index_teas_on_subscriptions_id"
  end

  add_foreign_key "subscriptions", "customers", column: "customers_id"
  add_foreign_key "teas", "subscriptions", column: "subscriptions_id"
end
