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

ActiveRecord::Schema.define(:version => 20120429072224) do

  create_table "articles", :force => true do |t|
    t.string   "articleTitle"
    t.string   "articleContent", :limit => 2555, :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",                                        :null => false
    t.integer  "score"
  end

  add_index "articles", ["user_id"], :name => "index_articles_on_user_id"

  create_table "comments", :force => true do |t|
    t.string   "commentContent", :limit => 2555
    t.integer  "user_id"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "score",                          :default => 0
  end

  add_index "comments", ["article_id"], :name => "index_comments_on_article_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

  create_table "vote_articles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.integer  "vote_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vote_articles", ["user_id", "article_id", "vote_type_id"], :name => "index_vote_articles_on_user_id_and_article_id_and_vote_type_id", :unique => true

  create_table "vote_comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "comment_id"
    t.integer  "vote_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vote_comments", ["user_id", "comment_id", "vote_type_id"], :name => "index_vote_comments_on_user_id_and_comment_id_and_vote_type_id", :unique => true

  create_table "vote_types", :force => true do |t|
    t.string   "type_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
