class MoviesController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def movie_params
    params.require(:movie).permit(:name)
  end


end
