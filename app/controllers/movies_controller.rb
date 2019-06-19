class MoviesController < ApplicationController

  def index
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
      redirect_to @movie
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
      redirect to @movie
    else
      render 'edit'
    end
  end

  def destroy
    @movie = Movie.find(params[:id]).destroy
  end

  private

  def movie_params
    params.require(:movie).permit(:name)
  end


end
