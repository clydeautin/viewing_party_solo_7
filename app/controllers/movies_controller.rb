class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    
    search_terms = params[:search_keywords]
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers["X-Api-Key"] = Rails.application.credentials.movie_db[:key]
    end

    response = conn.get("/3/search/movie?query=#{search_terms}&include_adult=false&language=en-US&page=1") do |req|
      req.params['api_key'] = Rails.application.credentials.movie_db[:key]
    end

    @movies = JSON.parse(response.body, symbolize_names: true)[:results]
    # require 'pry'; binding.pry  
  end
end