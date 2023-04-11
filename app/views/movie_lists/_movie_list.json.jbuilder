json.extract! movie_list, :id, :title, :max_movies, :created_at, :updated_at
json.url movie_list_url(movie_list, format: :json)
