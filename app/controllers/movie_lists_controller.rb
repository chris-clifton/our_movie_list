class MovieListsController < ApplicationController
  before_action :logged_in_user

  def new
    @movie = Movie.find(params[:movie_id])
    @lists = List.where('user_id = ?', current_user.id) 
    @movie_list = MovieList.new
  end

  def create
    @movie_list = MovieList.create(movie_list_params)
    @movie = Movie.find(params[:movie_list][:movie_id])
    @list = List.find(params[:movie_list][:list_id])
    if @movie_list.save
      flash[:success] = "#{@movie.name} added to '#{@list.name}'"
      redirect_to @list
    else
      flash[:warning] = "#{@movie.name} is already on #{@list.name}'"
      redirect_to @movie
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @movie = Movie.find(params[:movie_id])
    @movie_list = MovieList.find_by_list_id_and_movie_id(@list.id, params[:movie_id])
    @movie_list.destroy
    flash[:success] = "#{@movie.name} removed from '#{@list.name}'"
    redirect_to @list
  end

  private

  def movie_list_params
    params.require(:movie_list).permit(:movie_id, :list_id)
  end
end
