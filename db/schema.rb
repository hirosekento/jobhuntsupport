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

ActiveRecord::Schema[7.0].define(version: 2022_08_23_112150) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.text "que"
    t.text "content"
    t.integer "que_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "resume_id"
    t.index ["resume_id"], name: "index_cards_on_resume_id"
  end

  create_table "corps", force: :cascade do |t|
    t.string "name"
    t.integer "wish_lv"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "start_time"
    t.bigint "corp_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["corp_id"], name: "index_events_on_corp_id"
  end

  create_table "ques", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resumes", force: :cascade do |t|
    t.string "title"
    t.integer "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "corp_id", null: false
    t.index ["corp_id"], name: "index_resumes_on_corp_id"
  end

  add_foreign_key "cards", "resumes"
  add_foreign_key "events", "corps"
  add_foreign_key "resumes", "corps"
end
