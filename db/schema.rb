# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2025_02_08_173647) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "channels", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_channels_on_email", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "video_id", null: false
    t.bigint "channel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "content"
    t.index ["channel_id"], name: "index_comments_on_channel_id"
    t.index ["video_id"], name: "index_comments_on_video_id"
  end

  create_table "histories", force: :cascade do |t|
    t.bigint "channel_id", null: false
    t.bigint "video_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_histories_on_channel_id"
    t.index ["video_id"], name: "index_histories_on_video_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "channel_id", null: false
    t.bigint "video_id", null: false
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_ratings_on_channel_id"
    t.index ["video_id"], name: "index_ratings_on_video_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "channel_id", null: false
    t.bigint "subscriber_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_subscriptions_on_channel_id"
    t.index ["subscriber_id"], name: "index_subscriptions_on_subscriber_id"
  end

  create_table "videos", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "subtitle"
    t.integer "likes"
    t.integer "dislikes"
    t.bigint "channel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_videos_on_channel_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "channels"
  add_foreign_key "comments", "videos"
  add_foreign_key "histories", "channels"
  add_foreign_key "histories", "videos"
  add_foreign_key "ratings", "channels"
  add_foreign_key "ratings", "videos"
  add_foreign_key "subscriptions", "channels"
  add_foreign_key "subscriptions", "channels", column: "subscriber_id"
  add_foreign_key "videos", "channels"
end
