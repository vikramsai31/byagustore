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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130424001631) do

  create_table "addresses", :id => false, :force => true do |t|
    t.integer  "id"
    t.string   "first_name",       :limit => 30
    t.string   "last_name",        :limit => 30
    t.string   "addressable_type", :limit => 5
    t.integer  "addressable_id"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state",            :limit => 25
    t.string   "zip",              :limit => 10
    t.integer  "phone"
    t.string   "adefault",         :limit => 10
    t.string   "billing_default",  :limit => 10
    t.string   "active",           :limit => 3
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "baddresses", :force => true do |t|
    t.string   "bfirst_name"
    t.string   "blast_name"
    t.string   "baddress1"
    t.string   "baddress2"
    t.string   "bcity"
    t.string   "bstate"
    t.string   "string"
    t.string   "bzipcode"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "carts", :force => true do |t|
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.datetime "purchased_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "division",    :limit => 100
    t.string   "subdivision", :limit => 100
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "categories", ["division", "subdivision"], :name => "division", :unique => true

  create_table "line_items", :force => true do |t|
    t.integer  "product_id",                                 :null => false
    t.integer  "cart_id",                                    :null => false
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.integer  "quantity",                    :default => 1
    t.string   "variant",       :limit => 10
    t.string   "variant_value", :limit => 10
  end

  create_table "merchants", :force => true do |t|
    t.string   "Merchant_name",   :limit => 50
    t.string   "First_name",      :limit => 25, :null => false
    t.string   "Last_name",       :limit => 25, :null => false
    t.string   "Email",           :limit => 35, :null => false
    t.string   "address",         :limit => 55
    t.string   "city",            :limit => 25
    t.string   "state",           :limit => 3
    t.string   "primary_phone",   :limit => 14, :null => false
    t.string   "secondary_phone", :limit => 14
    t.string   "active",          :limit => 1,  :null => false
    t.string   "merchant_type",   :limit => 50, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "cart_id"
    t.string   "shipping_first_name"
    t.string   "shipping_last_name"
    t.string   "shipping_middle_name"
    t.string   "shipping_address1"
    t.string   "shipping_address2"
    t.string   "shipping_city"
    t.string   "shipping_state"
    t.integer  "shipping_zip"
    t.string   "billing_first_name"
    t.string   "billing_last_name"
    t.string   "billing_middle_name"
    t.string   "billing_address1"
    t.string   "billing_address2"
    t.string   "billing_city"
    t.string   "billing_state"
    t.string   "billing_zip"
    t.string   "order_no"
    t.string   "transaction_status",                 :default => "F"
    t.integer  "total"
    t.integer  "shipping_fee",                       :default => 0
    t.integer  "sales_tax",                          :default => 0
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.string   "ip_address",           :limit => 25
    t.string   "card_type",            :limit => 10
    t.date     "card_expires_on"
    t.integer  "card_verification"
    t.integer  "user_id"
  end

  add_index "orders", ["user_id"], :name => "user_id"

  create_table "photos", :force => true do |t|
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "data_file_name",    :limit => 25
    t.string   "data_content_type", :limit => 25
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
  end

  add_index "photos", ["product_id"], :name => "prod_fk"

  create_table "products", :force => true do |t|
    t.integer  "merchant_id"
    t.string   "name",            :limit => 35
    t.string   "brand",           :limit => 35
    t.string   "brand_model_no",  :limit => 35
    t.text     "description"
    t.string   "heading1",        :limit => 350
    t.text     "heading1_desc"
    t.string   "heading2",        :limit => 350
    t.text     "heading2_desc"
    t.string   "dimensions",      :limit => 10
    t.integer  "weight"
    t.string   "size_available",  :limit => 25
    t.decimal  "price",                          :precision => 10, :scale => 0
    t.string   "color_available", :limit => 100
    t.string   "model_no",        :limit => 20
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id",                                                   :null => false
  end

  add_index "products", ["merchant_id"], :name => "merchant_fk"

  create_table "saddresses", :force => true do |t|
    t.string   "sfirst_name"
    t.string   "slast_name"
    t.string   "saddress1"
    t.string   "saddress2"
    t.string   "scity"
    t.string   "sstate"
    t.string   "string"
    t.string   "szipcode"
    t.string   "sphone"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "transactions", :force => true do |t|
    t.integer  "order_id"
    t.string   "action"
    t.integer  "amount"
    t.boolean  "success"
    t.string   "authorization"
    t.string   "message"
    t.text     "params"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "card_type",       :limit => 10
    t.integer  "cvv"
    t.date     "card_expires_on"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
