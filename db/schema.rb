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

ActiveRecord::Schema.define(version: 20140524193042) do

  create_table "addresses", force: true do |t|
    t.string  "street"
    t.string  "building"
    t.string  "unit"
    t.string  "city"
    t.string  "zip_code"
    t.integer "company_id"
  end

  add_index "addresses", ["company_id"], name: "index_addresses_on_company_id"

  create_table "companies", force: true do |t|
    t.string "name"
    t.string "nip"
    t.string "phone"
    t.string "person"
    t.string "type"
  end

  create_table "invoices", force: true do |t|
    t.date     "date"
    t.integer  "payment_time"
    t.integer  "contractor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invoices", ["contractor_id"], name: "index_invoices_on_contractor_id"

  create_table "orders", force: true do |t|
    t.integer  "invoice_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["invoice_id"], name: "index_orders_on_invoice_id"
  add_index "orders", ["product_id"], name: "index_orders_on_product_id"

  create_table "products", force: true do |t|
    t.string  "name"
    t.integer "price_in_cents"
    t.integer "tax"
  end

end
