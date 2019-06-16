class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @list = current_user.lists.build
      @list_feed_items = current_user.list_feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
