class TopRatedMoviesController < ApplicationController
  def index

    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers["X-Api-Key"] = Rails.application.credentials.movie_db[:key]
    end

    response = conn.get("/3/movie/top_rated?language=en-US&page=1") do |req|
      req.params['api_key'] = Rails.application.credentials.movie_db[:key]
    end

    @movies = JSON.parse(response.body, symbolize_names: true)[:results]
  end
end