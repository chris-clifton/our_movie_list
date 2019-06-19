class MovieListsController < ApplicationController
  before_action :logged_in_user

  def new
    @movie = Movie.find(params[:movie_id])
    @lists = List.where('user_id = ?', current_user.id) 
    @movie_list = MovieList.new
  end

  def create 
    debugger
  end

  def update
  end

  def destroy
  end

  private

  def movie_list_params
    params.require(:movie_list).permit(:movie_id, :list_id)
  end
end
