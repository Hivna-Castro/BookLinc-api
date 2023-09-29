# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_230_920_150_814) do
  create_table 'authors', force: :cascade do |t|
    t.string 'name'
    t.date 'birth_date'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'books', force: :cascade do |t|
    t.string 'name'
    t.integer 'author_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['author_id'], name: 'index_books_on_author_id'
  end

  create_table 'newsletters', force: :cascade do |t|
    t.string 'title'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'author_id', null: false
    t.index ['author_id'], name: 'index_newsletters_on_author_id'
  end

  create_table 'readers', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'subscriptions', force: :cascade do |t|
    t.integer 'reader_id', null: false
    t.integer 'newsletter_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['newsletter_id'], name: 'index_subscriptions_on_newsletter_id'
    t.index ['reader_id'], name: 'index_subscriptions_on_reader_id'
  end

  add_foreign_key 'books', 'authors'
  add_foreign_key 'newsletters', 'authors'
  add_foreign_key 'subscriptions', 'newsletters'
  add_foreign_key 'subscriptions', 'readers'
end
