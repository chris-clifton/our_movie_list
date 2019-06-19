class ListsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, only: :destroy

  def index
    @lists = List.where('user_id = ?', current_user.id)
  end

  def show
    @list = List.find(params[:id])
  end
  
  def new
  end

  def create
    @list = current_user.lists.build(list_params)
    if @list.save
      flash[:success] = "List created!"
      redirect_to root_url
    else
      @list_feed_items = []
      render 'static_pages/home'
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
  end

  def destroy
    @list.destroy
    flash[:success] = "List deleted."
    redirect_to request.referrer || root_url
  end

  private

    def list_params
      params.require(:list).permit(:name)
    end

    def correct_user
      @list = current_user.lists.find_by(id: params[:id])
      redirect_to root_url if @list.nil?
    end
end
