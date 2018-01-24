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

ActiveRecord::Schema.define(version: 20180106201905) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assets", force: :cascade do |t|
    t.string "filename"
    t.text "term"
    t.integer "year"
    t.integer "file_type_id"
    t.integer "course_id"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "lecturer_id"
    t.integer "request_id"
    t.index ["course_id", "file_type_id", "user_id"], name: "index_assets_on_course_id_and_file_type_id_and_user_id"
    t.index ["course_id", "file_type_id"], name: "index_assets_on_course_id_and_file_type_id"
    t.index ["lecturer_id"], name: "index_assets_on_lecturer_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "course_code"
    t.string "course_description"
    t.integer "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_courses_on_department_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "department_code"
    t.string "department_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "downloads", force: :cascade do |t|
    t.integer "user_id"
    t.integer "asset_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "asset_id"], name: "index_downloads_on_user_id_and_asset_id"
  end

  create_table "file_types", force: :cascade do |t|
    t.string "file_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lecturers", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.integer "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_lecturers_on_department_id"
  end

  create_table "requests", force: :cascade do |t|
    t.integer "course_id"
    t.integer "user_id"
    t.integer "file_type_id"
    t.integer "lecturer_id"
    t.string "description"
    t.integer "closed_by_user_id"
    t.integer "asset_id"
    t.boolean "is_completed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_requests_on_course_id"
    t.index ["file_type_id"], name: "index_requests_on_file_type_id"
    t.index ["lecturer_id"], name: "index_requests_on_lecturer_id"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "user_courses", force: :cascade do |t|
    t.integer "user_id"
    t.integer "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "course_id"], name: "index_user_courses_on_user_id_and_course_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "classyear"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
