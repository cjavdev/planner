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

ActiveRecord::Schema[8.1].define(version: 2019_03_02_033016) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "lat"
    t.string "lng"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "homies", force: :cascade do |t|
    t.string "name"
    t.string "lat"
    t.string "lng"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "schools", force: :cascade do |t|
    t.integer "region_id"
    t.string "students_per_teacher"
    t.string "grades"
    t.string "size"
    t.string "name"
    t.string "lat"
    t.string "lng"
    t.integer "gs_rating"
    t.string "school_type"
    t.integer "gs_school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "levels"
    t.boolean "elementary", default: false
  end
end
