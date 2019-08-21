require 'test_helper'

class FriendshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @friend1 = users(:bones)
    @friend2 = users(:archer)
    @no_friends = users(:lana)
    @friendship = Friendship.new(user_id: @friend1.id, friend_id: @friend2.id)
    #current_user = @friend1
  end

  test "should be valid" do
    assert @friendship.valid?
  end

  test "should require friend_user_id" do
    @friendship.friend_id = nil
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
end
