class MovieList < ApplicationRecord
  has_many :fave_movies, dependent: :destroy  
end
