# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141026084024) do

  create_table "questions", force: true do |t|
    t.string   "question"
    t.string   "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quiz_sessions", force: true do |t|
    t.string   "hash_code"
    t.integer  "current_question_id"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "quiz_sessions", ["hash_code"], name: "index_quiz_sessions_on_hash_code", unique: true

  create_table "user_questions", force: true do |t|
    t.integer  "quiz_session_id"
    t.integer  "question_id"
    t.string   "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_questions", ["question_id"], name: "index_user_questions_on_question_id"
  add_index "user_questions", ["quiz_session_id"], name: "index_user_questions_on_quiz_session_id"

end
