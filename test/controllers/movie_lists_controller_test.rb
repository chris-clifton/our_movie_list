require 'test_helper'

class MovieListsControllerTest < ActionDispatch::IntegrationTest
 
  def setup
    @user  = users(:bones)
    @other_user = users(:archer)
    @movie = movies(:bones)
    @list  = lists(:bones)
    @movie_list = MovieList.create(movie_id: @movie.id, list_id: @list.id)
  end

  test "should get new" do
    log_in_as(@user)
    get new_movie_list_path, params: { movie_id: @movie.id }
    assert_response :success
  end

  test "should redirect when not logged in" do
    get new_movie_list_path, params: {movie_id: @movie.id }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

end
