class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    search_terms = params[:search_keywords]
    @movies = MovieService.get_movies_by_search(search_terms)
  end

  def show
    #hit the api to get the movie details
    @user = User.find(params[:user_id])
    movie_id = params[:id]
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers["X-Api-Key"] = Rails.application.credentials.movie_db[:key]
    end

    response = conn.get("/3/movie/#{movie_id}?language=en-US") do |req|
      req.params['api_key'] = Rails.application.credentials.movie_db[:key]
    end

    data = JSON.parse(response.body, symbolize_names: true)
    @movie = Movie.new(data)

    credit_response = conn.get("/3/movie/#{movie_id}/credits?language=en-US") do |req|
      req.params['api_key'] = Rails.application.credentials.movie_db[:key]
    end

    credit_data = JSON.parse(credit_response.body, symbolize_names: true)
    @credits = Credit.new(credit_data)

    review_response = conn.get("/3/movie/#{movie_id}/reviews?language=en-US") do |req|
      req.params['api_key'] = Rails.application.credentials.movie_db[:key]
    end

    review_response = JSON.parse(review_response.body, symbolize_names: true)
    @reviews = Review.new(review_response)
  end
end