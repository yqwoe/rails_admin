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

ActiveRecord::Schema.define(version: 20170914021805) do

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
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "type_id", "parent_id"], name: "index_groups_on_name_and_type_id_and_parent_id"
    t.index ["name"], name: "index_groups_on_name"
    t.index ["parent_id"], name: "index_groups_on_parent_id"
    t.index ["type_id"], name: "index_groups_on_type_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "key"
    t.string "icon"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "menu_id"
    t.string "ancestry"
    t.index ["ancestry"], name: "index_resources_on_ancestry"
    t.index ["key"], name: "index_resources_on_key"
    t.index ["menu_id"], name: "index_resources_on_menu_id"
    t.index ["name"], name: "index_resources_on_name"
    t.index ["parent_id"], name: "index_resources_on_parent_id"
    t.index ["url"], name: "index_resources_on_url"
  end

  create_table "role_resources", force: :cascade do |t|
    t.integer "role_id"
    t.integer "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "actions", array: true
    t.index ["actions"], name: "index_role_resources_on_actions"
    t.index ["role_id", "resource_id"], name: "index_role_resources_on_role_id_and_resource_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.integer "resource_id"
    t.string "resource_type"
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
