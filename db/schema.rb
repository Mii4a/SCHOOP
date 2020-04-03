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

ActiveRecord::Schema.define(version: 2020_04_03_134915) do

  create_table "school_chats", force: :cascade do |t|
    t.integer "user_id"
    t.integer "school_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id", "created_at"], name: "index_school_chats_on_school_id_and_created_at"
    t.index ["school_id"], name: "index_school_chats_on_school_id"
    t.index ["user_id"], name: "index_school_chats_on_user_id"
  end

  create_table "school_relationships", force: :cascade do |t|
    t.integer "student_id"
    t.integer "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_school_relationships_on_school_id"
    t.index ["student_id", "school_id"], name: "index_school_relationships_on_student_id_and_school_id", unique: true
    t.index ["student_id"], name: "index_school_relationships_on_student_id"
  end

  create_table "schools", force: :cascade do |t|
    t.text "sub_title"
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "content"
    t.string "picture"
    t.index ["user_id", "created_at"], name: "index_schools_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_schools_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "unique_name"
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["unique_name"], name: "index_users_on_unique_name", unique: true
  end

end
