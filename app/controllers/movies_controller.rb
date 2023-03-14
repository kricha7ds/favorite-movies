class MoviesController < ApplicationController
  def index
    jurassic_park_id = "329"
    response = TMDB.client.get_movie(jurassic_park_id)
    @movie = response["body"]
  end
end
