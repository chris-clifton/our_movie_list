# Movies#index
- Small plex movie placeholder: https://via.placeholder.com/123x185/000000/FFFFFF?text=movie
- Large plex movie placeholder: https://via.placeholder.com/240x360/000000/FFFFFF?text=movie

 require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase

  def setup
    @friend_1 = users(:bones)
    @friend_2 = users(:archer)
    @no_friends = users(:lana)

    @friendship = Friendship.new(user_id: @friend_1.id, friend_user_id: @friend_2.id)
  end

  test "should be valid" do
    assert @friendship.valid?
  end

  test "should require friend_user_id" do
    @friendship.friend_user_id = nil
    assert_not @friendship.valid?
  end

  test "should require user_id" do
    @friendship.user_id = nil
    assert_not @friendship.valid?
  end

  test "should friend and unfriend a user" do
    assert_not @friend1.friends?(@no_friends)
    @friend1.friend(@no_friends)
    assert @friend1.friends?(@no_friends)
    @friend1.unfriend(@no_friends)
    assert_not @friend1.friends?(@no_friends)
  end