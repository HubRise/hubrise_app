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

ActiveRecord::Schema.define(version: 2019_01_16_155419) do

  create_table "hr_accounts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "hr_id", null: false
    t.json "hr_api_data", null: false
    t.datetime "refreshed_at", null: false
    t.index ["hr_id"], name: "index_hr_accounts_on_hr_id", unique: true
  end

  create_table "hr_app_instances", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "hr_id", null: false
    t.string "hr_account_id"
    t.string "hr_location_id"
    t.string "hr_catalog_id"
    t.string "hr_customer_list_id"
    t.string "hr_access_token", null: false
    t.index ["hr_account_id"], name: "index_hr_app_instances_on_hr_account_id"
    t.index ["hr_id"], name: "index_hr_app_instances_on_hr_id", unique: true
    t.index ["hr_location_id"], name: "index_hr_app_instances_on_hr_location_id"
  end

  create_table "hr_locations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "hr_id", null: false
    t.json "hr_api_data", null: false
    t.datetime "refreshed_at", null: false
    t.index ["hr_id"], name: "index_hr_locations_on_hr_id", unique: true
  end

  create_table "hr_user_app_instances", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "hr_user_id"
    t.string "hr_app_instance_id"
    t.datetime "refreshed_at", null: false
    t.index ["hr_app_instance_id"], name: "index_hr_user_app_instances_on_hr_app_instance_id"
    t.index ["hr_user_id", "hr_app_instance_id", "refreshed_at"], name: "index_user_app_instances"
    t.index ["hr_user_id"], name: "index_hr_user_app_instances_on_hr_user_id"
  end

  create_table "hr_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "hr_id", null: false
    t.json "hr_api_data", null: false
    t.string "hr_access_token", null: false
    t.datetime "refreshed_at", null: false
    t.index ["hr_id"], name: "index_hr_users_on_hr_id", unique: true
  end

  add_foreign_key "hr_app_instances", "hr_accounts", primary_key: "hr_id"
  add_foreign_key "hr_app_instances", "hr_locations", primary_key: "hr_id"
  add_foreign_key "hr_user_app_instances", "hr_app_instances", primary_key: "hr_id"
  add_foreign_key "hr_user_app_instances", "hr_users", primary_key: "hr_id"
end
