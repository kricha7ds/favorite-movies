json.extract! fave_movie, :id, :tmdb_id, :title, :release_date, :poster_path, :movie_list_id, :created_at, :updated_at
json.url fave_movie_url(fave_movie, format: :json)
