class MovieListsController < ApplicationController
  before_action :set_movie_list, only: %i[ show edit update destroy ]

  # GET /movie_lists or /movie_lists.json
  def index
    @movie_lists = MovieList.all
  end

  # GET /movie_lists/1 or /movie_lists/1.json
  def show
  end

  # GET /movie_lists/new
  def new
    @movie_list = MovieList.new
  end

  # GET /movie_lists/1/edit
  def edit
  end

  # POST /movie_lists or /movie_lists.json
  def create
    @movie_list = MovieList.new(movie_list_params)

    respond_to do |format|
      if @movie_list.save
        format.html { redirect_to movie_list_url(@movie_list), notice: "Movie list was successfully created." }
        format.json { render :show, status: :created, location: @movie_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movie_lists/1 or /movie_lists/1.json
  def update
    respond_to do |format|
      if @movie_list.update(movie_list_params)
        format.html { redirect_to movie_list_url(@movie_list), notice: "Movie list was successfully updated." }
        format.json { render :show, status: :ok, location: @movie_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movie_lists/1 or /movie_lists/1.json
  def destroy
    @movie_list.destroy

    respond_to do |format|
      format.html { redirect_to movie_lists_url, notice: "Movie list was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie_list
      @movie_list = MovieList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_list_params
      params.require(:movie_list).permit(:title, :max_movies)
    end
end
