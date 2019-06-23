class MoviesController < ApplicationController

  def index
    @movie = Movie.new
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params)
    if @movie.save
      flash[:success] = "Movie added!"
      redirect_to movies_path
    else
      render 'new'
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      flash[:success] = "Movie updated!"
      redirect_to @movie
    else
      render 'edit'
    end
  end

  def destroy
    @movie = Movie.find(params[:id]).destroy
    flash[:success] = "Movie deleted!"
    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :poster)
  end


end
