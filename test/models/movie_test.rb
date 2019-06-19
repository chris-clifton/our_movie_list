require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  
  def setup
    @movie = movies(:bones)
  end

  test "should be valid" do
    assert @movie.valid?
  end

  test "name should be present" do
    @movie.name = "     "
    assert_not @movie.valid?
  end

  test "name should not be too long" do
    @movie.name = "a" * 51
    assert_not @movie.valid?
  end
end
