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

ActiveRecord::Schema[7.0].define(version: 2023_04_12_051353) do
  create_table "fave_movies", force: :cascade do |t|
    t.integer "tmdb_id"
    t.string "title"
    t.string "release_date"
    t.string "poster_path"
    t.integer "movie_list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_list_id"], name: "index_fave_movies_on_movie_list_id"
  end

  create_table "movie_lists", force: :cascade do |t|
    t.string "title"
    t.integer "max_movies"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "fave_movies", "movie_lists"
end
