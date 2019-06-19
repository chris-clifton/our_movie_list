require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest
   
  def setup
    @movie = movies(:bones)
  end

  test "should get new" do
    get movies_path
    assert_response :success
  end

end
