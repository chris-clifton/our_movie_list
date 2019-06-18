require 'test_helper'

class ListsInterfaceTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:bones)
  end

  test "lists interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
    # Invalid submission
    assert_no_difference 'List.count' do
      post lists_path, params: { list: { name: "" } }
    end
    # Valid submission
    name = "Valid List Name"
    assert_difference 'List.count', 1 do
      post lists_path, params: { list: { name: name } }
    end
    assert_redirected_to root_url
    follow_redirect!
    # assert_match name, response.body
    # Delete list
    first_list = @user.lists.paginate(page: 1).first
    assert_difference 'List.count', -1 do
      delete list_path(first_list)
    end
    # Visit different user (no delete links)
    get user_path(users(:archer))
    assert_select 'a', text: 'Delete', count: 0
  end

  # TODO: Fix this test
  # test "list sidebar count" do
  #   log_in_as(@user)
  #   get root_path
  #   assert_match "#{@user.lists.count} lists", response.body
  #   # User with zero lists
  #   other_user = users(:lana)
  #   log_in_as(other_user)
  #   get root_path
  #   assert_match "0 lists", response.body
  #   other_user.lists.create!(content: "A list")
  #   get root_path
  #   assert_match "1 list", response.body
  # end

end

