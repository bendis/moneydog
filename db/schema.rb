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

ActiveRecord::Schema[8.1].define(version: 2024_01_01_000001) do
  create_table "expenses", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.boolean "from_savings", default: false
    t.index ["user_id"], name: "index_expenses_on_user_id"
  end

  create_table "fixed_expenses", force: :cascade do |t|
    t.string "name"
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.datetime "valid_from"
    t.datetime "valid_to"
    t.index ["user_id"], name: "index_fixed_expenses_on_user_id"
  end

  create_table "fixed_incomes", force: :cascade do |t|
    t.string "name"
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.datetime "valid_from"
    t.datetime "valid_to"
    t.index ["user_id"], name: "index_fixed_incomes_on_user_id"
  end

  create_table "incomes", force: :cascade do |t|
    t.string "name"
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.integer "user_id"
    t.index ["user_id"], name: "index_incomes_on_user_id"
  end

  create_table "savings", force: :cascade do |t|
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_savings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "expenses", "users"
  add_foreign_key "fixed_expenses", "users"
  add_foreign_key "fixed_incomes", "users"
  add_foreign_key "incomes", "users"
  add_foreign_key "savings", "users"
end
