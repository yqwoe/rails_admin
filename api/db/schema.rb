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

ActiveRecord::Schema.define(version: 20170824051826) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "group_users", force: :cascade do |t|
    t.integer "group_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id", "user_id"], name: "index_group_users_on_group_id_and_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.integer "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "type_id"], name: "index_groups_on_name_and_type_id"
    t.index ["name"], name: "index_groups_on_name"
  end

  create_table "resources", force: :cascade do |t|
    t.string "name"
    t.integer "parent_id"
    t.string "api_url"
    t.string "web_url"
    t.string "key"
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["api_url"], name: "index_resources_on_api_url"
    t.index ["icon"], name: "index_resources_on_icon"
    t.index ["key"], name: "index_resources_on_key"
    t.index ["name"], name: "index_resources_on_name"
    t.index ["parent_id"], name: "index_resources_on_parent_id"
    t.index ["web_url"], name: "index_resources_on_web_url"
  end

  create_table "role_resources", force: :cascade do |t|
    t.integer "role_id"
    t.integer "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id", "resource_id"], name: "index_role_resources_on_role_id_and_resource_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_roles_on_name"
    t.index ["title"], name: "index_roles_on_title"
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "role_id"], name: "index_user_roles_on_user_id_and_role_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "mobile"
    t.string "password_digest"
    t.string "authentication_token"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mobile"], name: "index_users_on_mobile"
    t.index ["name"], name: "index_users_on_name"
    t.index ["username"], name: "index_users_on_username"
  end

end
