class FaveMoviesController < ApplicationController
  before_action :set_fave_movie, only: %i[ show edit update destroy ]

  # GET /fave_movies or /fave_movies.json
  def index
    @fave_movies = FaveMovie.all
  end

  # GET /fave_movies/1 or /fave_movies/1.json
  def show
  end

  # GET /fave_movies/new
  def new
    @fave_movie = FaveMovie.new
  end

  # GET /fave_movies/1/edit
  def edit
  end

  # POST /fave_movies or /fave_movies.json
  def create
    @fave_movie = FaveMovie.new(fave_movie_params)

    respond_to do |format|
      if @fave_movie.save
        format.html { redirect_to fave_movie_url(@fave_movie), notice: "Fave movie was successfully created." }
        format.json { render :show, status: :created, location: @fave_movie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fave_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fave_movies/1 or /fave_movies/1.json
  def update
    respond_to do |format|
      if @fave_movie.update(fave_movie_params)
        format.html { redirect_to fave_movie_url(@fave_movie), notice: "Fave movie was successfully updated." }
        format.json { render :show, status: :ok, location: @fave_movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fave_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fave_movies/1 or /fave_movies/1.json
  def destroy
    @fave_movie.destroy

    respond_to do |format|
      format.html { redirect_to fave_movies_url, notice: "Fave movie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fave_movie
      @fave_movie = FaveMovie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fave_movie_params
      params.require(:fave_movie).permit(:tmdb_id, :title, :release_date, :poster_path, :movie_list_id)
    end
end
