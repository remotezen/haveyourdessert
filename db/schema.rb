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

ActiveRecord::Schema.define(version: 18) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: :cascade do |t|
    t.string   "user_id"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "post_id"
  end

  create_table "nutrients", id: false, force: :cascade do |t|
    t.string  "name"
    t.string  "group"
    t.string  "protein"
    t.string  "calcium"
    t.string  "sodium"
    t.string  "fiber"
    t.string  "vitamin_c"
    t.string  "potassium"
    t.string  "carbohydrate"
    t.string  "sugars"
    t.string  "fat"
    t.string  "water"
    t.string  "calories"
    t.string  "saturated"
    t.string  "monounsat"
    t.string  "polyunsat"
    t.integer "product_id"
  end

  add_index "nutrients", ["product_id"], name: "index_nutrients_on_product_id", unique: true, using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "account_id"
    t.string   "category"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "permalink"
    t.integer  "comment_id"
    t.integer  "recipe_id"
  end

  add_index "posts", ["recipe_id"], name: "index_posts_on_recipe_id", using: :btree

  create_table "recipes", force: :cascade do |t|
    t.integer  "post_id"
    t.text     "ingredients"
    t.string   "image"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "permalink"
  end

  create_table "steps", force: :cascade do |t|
    t.integer  "post_id"
    t.text     "step"
    t.string   "image"
    t.string   "title"
    t.integer  "recipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uploads", force: :cascade do |t|
    t.text     "file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "comment_id"
    t.boolean  "admin",         default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
