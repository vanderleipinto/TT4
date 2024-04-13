require "test_helper"

class MoviesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movie = movies(:one)
  end

  test "should get index" do
    get movies_url, as: :json
    assert_response :success
  end

  test "should create movie" do
    assert_difference("Movie.count") do
      post movies_url, params: { movie: { cast: @movie.cast, country: @movie.country, date_added: @movie.date_added, description: @movie.description, director: @movie.director, duration: @movie.duration, listed_in: @movie.listed_in, rating: @movie.rating, release_year: @movie.release_year, show_id: @movie.show_id, type: @movie.type } }, as: :json
    end

    assert_response :created
  end

  test "should show movie" do
    get movie_url(@movie), as: :json
    assert_response :success
  end

  test "should update movie" do
    patch movie_url(@movie), params: { movie: { cast: @movie.cast, country: @movie.country, date_added: @movie.date_added, description: @movie.description, director: @movie.director, duration: @movie.duration, listed_in: @movie.listed_in, rating: @movie.rating, release_year: @movie.release_year, show_id: @movie.show_id, type: @movie.type } }, as: :json
    assert_response :success
  end

  test "should destroy movie" do
    assert_difference("Movie.count", -1) do
      delete movie_url(@movie), as: :json
    end

    assert_response :no_content
  end
end
