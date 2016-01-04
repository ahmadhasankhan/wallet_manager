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

ActiveRecord::Schema.define(version: 20151220145433) do

  create_table "accounts", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.decimal  "balance",                 precision: 15, scale: 4, default: 0.0,  null: false
    t.decimal  "monthly_limit",           precision: 15, scale: 4, default: 0.0,  null: false
    t.decimal  "limit",                   precision: 15, scale: 4, default: 0.0,  null: false
    t.boolean  "active",                                           default: true
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
  end

  add_index "accounts", ["active"], name: "index_accounts_on_active", using: :btree
  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id", using: :btree

  create_table "m_transactions", force: :cascade do |t|
    t.integer  "account_id",       limit: 4
    t.string   "reference_no",     limit: 255
    t.decimal  "amount",                         precision: 15, scale: 4, default: 0.0, null: false
    t.string   "transaction_type", limit: 255
    t.string   "transaction_mode", limit: 255
    t.integer  "status",           limit: 4
    t.text     "details",          limit: 65535
    t.datetime "created_at",                                                            null: false
    t.datetime "updated_at",                                                            null: false
  end

  add_index "m_transactions", ["account_id"], name: "index_m_transactions_on_account_id", using: :btree
  add_index "m_transactions", ["reference_no"], name: "index_m_transactions_on_reference_no", using: :btree

  create_table "refunds", force: :cascade do |t|
    t.integer  "transaction_id", limit: 4
    t.boolean  "approved",                     default: false
    t.integer  "status",         limit: 4
    t.string   "reason",         limit: 255
    t.text     "comment",        limit: 65535
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "refunds", ["approved"], name: "index_refunds_on_approved", using: :btree
  add_index "refunds", ["status"], name: "index_refunds_on_status", using: :btree
  add_index "refunds", ["transaction_id"], name: "index_refunds_on_transaction_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                limit: 255
    t.string   "mobile",               limit: 12
    t.string   "crypted_password",     limit: 255
    t.string   "password_salt",        limit: 255
    t.string   "persistence_token",    limit: 255
    t.string   "authentication_token", limit: 255
    t.string   "perishable_token",     limit: 255
    t.string   "single_access_token",  limit: 255
    t.integer  "login_count",          limit: 4,   default: 0,     null: false
    t.integer  "failed_login_count",   limit: 4,   default: 0,     null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip",     limit: 255
    t.string   "last_login_ip",        limit: 255
    t.boolean  "active",                           default: true
    t.boolean  "confirmed",                        default: false
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["mobile"], name: "index_users_on_mobile", using: :btree

end
