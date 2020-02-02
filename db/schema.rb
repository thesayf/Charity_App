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

ActiveRecord::Schema.define(version: 2020_02_01_223313) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "name", null: false
    t.string "email"
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["name"], name: "index_admins_on_name", unique: true
  end

  create_table "charities", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.text "business_address"
    t.bigint "admin_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin_id"], name: "index_charities_on_admin_id"
    t.index ["name"], name: "index_charities_on_name", unique: true
  end

  create_table "employees", force: :cascade do |t|
    t.string "name", null: false
    t.string "email"
    t.string "password_digest", null: false
    t.bigint "charity_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["charity_id"], name: "index_employees_on_charity_id"
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["name"], name: "index_employees_on_name", unique: true
  end

  create_table "projects", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "longitude"
    t.string "latitude"
    t.string "project_type"
    t.bigint "charity_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["charity_id"], name: "index_projects_on_charity_id"
    t.index ["name"], name: "index_projects_on_name", unique: true
  end

  create_table "residents", force: :cascade do |t|
    t.string "name", null: false
    t.string "email"
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_residents_on_email", unique: true
    t.index ["name"], name: "index_residents_on_name", unique: true
  end

  create_table "sessions", force: :cascade do |t|
    t.text "location", null: false
    t.text "description"
    t.text "business_address"
    t.bigint "project_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_sessions_on_project_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "resident_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_subscriptions_on_project_id"
    t.index ["resident_id"], name: "index_subscriptions_on_resident_id"
  end

end
