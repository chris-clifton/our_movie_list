require 'test_helper'

class MovieListTest < ActiveSupport::TestCase
  
  def setup
    @movie = movies(:bones)
    @list  = lists(:bones)
    @movie_list = MovieList.create(movie_id: @movie.id, list_id: @list.id)
  end

  test "should be valid" do
    assert @movie_list.valid?
  end

  test "cant make list without movie_id" do
    movie_list = MovieList.create(movie_id: nil, list_id: @list.id)
    assert_not movie_list.valid?
  end
  
  test "cant make list without list_id" do
    movie_list = MovieList.create(movie_id: @movie.id, list_id: nil)
    assert_not movie_list.valid?
  end

  test "cant make duplicate movie_list" do
    dupe_movie_id = @movie.id
    dupe_list_id  = @list.id
    new_movie_list = MovieList.create(movie_id: dupe_movie_id, list_id: dupe_list_id)
    assert_not new_movie_list.valid?
  end

  test "destroying movie destroys movie_list" do
    @movie.destroy
    assert_raises(ActiveRecord::RecordNotFound) do
      @movie_list.reload
    end
  end

  test "destroying list destroys movie_list" do
    @list.destroy
    assert_raises(ActiveRecord::RecordNotFound) do
      @movie_list.reload
    end
  end
end
