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

ActiveRecord::Schema[7.0].define(version: 2023_05_26_175152) do
  create_table "avrs", force: :cascade do |t|
    t.string "avr_name"
    t.boolean "avr_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_for_students", default: false
    t.string "avr_desc"
    t.string "avr_loc"
  end

  create_table "reservations", force: :cascade do |t|
    t.string "res_name"
    t.string "res_type"
    t.string "contact_num"
    t.date "res_date"
    t.string "res_time"
    t.string "sched_days"
    t.string "avr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "user_email"
    t.integer "slots"
    t.string "res_status"
    t.string "avr_status"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "full_name"
    t.string "uid"
    t.string "provider"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
