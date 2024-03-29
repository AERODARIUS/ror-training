# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_220_322_140_507) do
  create_table 'articles', force: :cascade do |t|
    t.string 'title'
    t.text 'text'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'topic', default: 0
    t.datetime 'previous_version_date'
    t.integer 'user_id'
    t.index ['user_id'], name: 'index_articles_on_user_id'
  end

  create_table 'comments', force: :cascade do |t|
    t.text 'body'
    t.integer 'article_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'user_id'
    t.index ['article_id'], name: 'index_comments_on_article_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email'
    t.string 'password'
    t.string 'name'
    t.date 'birthday'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'comments_id'
    t.integer 'articles_id'
    t.index ['articles_id'], name: 'index_users_on_articles_id'
    t.index ['comments_id'], name: 'index_users_on_comments_id'
  end
end
