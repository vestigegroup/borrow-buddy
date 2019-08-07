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

ActiveRecord::Schema.define(version: 2019_08_05_224037) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "borrows", force: :cascade do |t|
    t.bigint "recipient_id"
    t.bigint "item_id"
    t.integer "days_borrowed", default: 1
    t.integer "reminders_sent", default: 0
    t.boolean "returned", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_borrows_on_item_id"
    t.index ["recipient_id"], name: "index_borrows_on_recipient_id"
  end

  create_table "items", force: :cascade do |t|
    t.bigint "lender_id"
    t.string "name"
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lender_id"], name: "index_items_on_lender_id"
  end

  create_table "lenders", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_lenders_on_email", unique: true
    t.index ["reset_password_token"], name: "index_lenders_on_reset_password_token", unique: true
  end

  create_table "recipients", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end