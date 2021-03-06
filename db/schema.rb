# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_26_225613) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "assignees_task_lists", id: false, force: :cascade do |t|
    t.uuid "assignee_id", null: false
    t.uuid "task_list_id", null: false
    t.index ["assignee_id"], name: "index_assignees_task_lists_on_assignee_id"
    t.index ["task_list_id"], name: "index_assignees_task_lists_on_task_list_id"
  end

  create_table "direct_messages", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "sender_id", null: false
    t.uuid "recipient_id", null: false
    t.datetime "read_at"
    t.text "body", null: false
    t.index ["recipient_id"], name: "index_direct_messages_on_recipient_id"
    t.index ["sender_id"], name: "index_direct_messages_on_sender_id"
  end

  create_table "invitations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "sender_id", null: false
    t.uuid "recipient_id"
    t.datetime "date_sent"
    t.datetime "date_accepted"
    t.string "delivery_method"
    t.index ["recipient_id"], name: "index_invitations_on_recipient_id"
    t.index ["sender_id"], name: "index_invitations_on_sender_id"
  end

  create_table "task_lists", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title", null: false
    t.text "notes", default: ""
    t.uuid "creator_id"
    t.index ["creator_id"], name: "index_task_lists_on_creator_id"
  end

  create_table "tasks", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title", null: false
    t.text "notes", default: ""
    t.uuid "task_list_id"
    t.uuid "fulfiller_id"
    t.datetime "completed_at", precision: 6
    t.index ["fulfiller_id"], name: "index_tasks_on_fulfiller_id"
    t.index ["task_list_id"], name: "index_tasks_on_task_list_id"
  end

  create_table "user_connections", id: false, force: :cascade do |t|
    t.uuid "setter_id", null: false
    t.uuid "available_assignee_id", null: false
    t.index ["available_assignee_id"], name: "index_user_connections_on_available_assignee_id"
    t.index ["setter_id"], name: "index_user_connections_on_setter_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

end
