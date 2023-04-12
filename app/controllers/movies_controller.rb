class MoviesController < ApplicationController
  # def index
  #   jurassic_park_id = "329"
  #   response = TMDB.client.get_movie(jurassic_park_id)
  #   @movie = response["body"]

  #   metadata = response["body"]
  #   @title = metadata.dig(:original_title)
  #   @tagline = metadata.dig(:tagline)
  #   @runtime = metadata.dig(:runtime)
  #   @genres = []
    
  #   genres_collection = metadata.dig(:genres)

  #   genres_collection.each do |g|
  #     genre = g.dig(:name)
  #     @genres << genre unless genre.nil?
  #   end

  #   puts "================ DEBUG ================"
  #   puts "Here is some other movie metadata"
  #   puts "Title: #{@title}"
  #   puts "Tagline: #{@tagline}"
  #   puts "Genres: #{@genres}"
  #   puts "============== END DEBUG =============="
  # end

  def index
    if params[:search_query].present?
      @movies = TMDB.client.search_movies(params[:search_query])
    else
      @movies = []
    end

    if turbo_frame_request?
      render partial: "layouts/_search_results", movies: @movies, format: [:html]
    end
  end
end
