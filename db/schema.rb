# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_10_211443) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "costumers", force: :cascade do |t|
    t.string "external_id"
    t.string "name"
    t.string "email"
    t.string "contact"
    t.bigint "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_costumers_on_order_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "external_code"
    t.string "name"
    t.float "price"
    t.integer "quantity"
    t.float "total"
    t.bigint "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "external_code"
    t.integer "store_id"
    t.string "sub_total"
    t.string "delivery_fee"
    t.string "total"
    t.string "country"
    t.string "state"
    t.string "city"
    t.string "district"
    t.string "street"
    t.string "complement"
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.string "dt_order_create"
    t.string "postal_code"
    t.string "number"
    t.float "total_shipping"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payments", force: :cascade do |t|
    t.string "modality"
    t.float "value"
    t.bigint "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_payments_on_order_id"
  end

  add_foreign_key "costumers", "orders"
  add_foreign_key "items", "orders"
  add_foreign_key "payments", "orders"
end
