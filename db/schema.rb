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

ActiveRecord::Schema.define(version: 20150519131438) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "complete"
    t.boolean  "active"
    t.text     "solution"
    t.integer  "phase",       default: 0
    t.text     "pretest"
    t.text     "posttest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.text     "content"
    t.integer  "line_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "submission_id"
    t.integer  "user_id"
    t.integer  "pair_id"
  end

  create_table "conversations", force: true do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.integer  "comment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "conversations", ["comment_id"], name: "index_conversations_on_comment_id", using: :btree
  add_index "conversations", ["recipient_id"], name: "index_conversations_on_recipient_id", using: :btree
  add_index "conversations", ["sender_id"], name: "index_conversations_on_sender_id", using: :btree

  create_table "messages", force: true do |t|
    t.text     "body"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "notes", force: true do |t|
    t.text     "content"
    t.boolean  "general"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "submission_id"
  end

  create_table "pairs", force: true do |t|
    t.integer  "partner_1"
    t.integer  "partner_2"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "assignment_id"
  end

  create_table "pairs_users", id: false, force: true do |t|
    t.integer "pair_id"
    t.integer "user_id"
  end

  add_index "pairs_users", ["pair_id"], name: "index_pairs_users_on_pair_id", using: :btree
  add_index "pairs_users", ["user_id"], name: "index_pairs_users_on_user_id", using: :btree

  create_table "submissions", force: true do |t|
    t.text     "content"
    t.text     "pretest"
    t.text     "posttest"
    t.integer  "length",        default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "assignment_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
