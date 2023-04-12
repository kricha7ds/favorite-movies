class CreateFaveMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :fave_movies do |t|
      t.integer :tmdb_id
      t.string :title
      t.string :release_date
      t.string :poster_path
      t.references :movie_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
