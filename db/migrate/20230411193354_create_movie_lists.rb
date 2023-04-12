class CreateMovieLists < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_lists do |t|
      t.string :title
      t.integer :max_movies

      t.timestamps
    end
  end
end
