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

ActiveRecord::Schema.define(version: 20_211_116_223_942) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'admin_users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['email'], name: 'index_admin_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_admin_users_on_reset_password_token', unique: true
  end

  create_table 'favorites', force: :cascade do |t|
    t.bigint 'movie_id', null: false
    t.bigint 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['movie_id'], name: 'index_favorites_on_movie_id'
    t.index ['user_id'], name: 'index_favorites_on_user_id'
  end

  create_table 'genres', force: :cascade do |t|
    t.string 'name', limit: 60
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'movie_genres', force: :cascade do |t|
    t.bigint 'movie_id', null: false
    t.bigint 'genre_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['genre_id'], name: 'index_movie_genres_on_genre_id'
    t.index ['movie_id'], name: 'index_movie_genres_on_movie_id'
  end

  create_table 'movies', force: :cascade do |t|
    t.string 'name', limit: 80
    t.integer 'year'
    t.string 'director', limit: 60
    t.string 'star', limit: 60
    t.text 'description'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'username', limit: 20
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'role', default: 0
  end

  add_foreign_key 'favorites', 'movies'
  add_foreign_key 'favorites', 'users'
  add_foreign_key 'movie_genres', 'genres'
  add_foreign_key 'movie_genres', 'movies'
end
