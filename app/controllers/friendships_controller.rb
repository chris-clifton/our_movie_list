class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:destroy]
  before_action :logged_in_user

  def create
    @user = User.find(params[:friend_id])
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      redirect_to @user 
    else
      flash[:danger] = "A friend request has already been sent to this user."
      redirect_to @user
    end
  end

  def destroy
    @user = Friendship.find(params[:id]).friend
    @friendship.destroy
    redirect_to @user
  end

  private

    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id)
    end
end
