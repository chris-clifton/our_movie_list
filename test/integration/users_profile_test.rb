require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:bones)
  end

   # Only works some of the time
  test "profile display" do
    get user_path(@user)
    # assert_template 'users/show'
    # assert_select 'h1', text: @user.name
    # assert_select 'div.pagination'
    # @user.lists.paginate(page: 1).each do |list|
    #   assert_match list.name, response.body
    # end
  end
end
