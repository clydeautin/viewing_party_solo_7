class MovieService

  # input -> search_terms: string
  # output -> API call repsponse parsed into JSON (array of hashes)

  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers["X-Api-Key"] = Rails.application.credentials.movie_db[:key]
    end
  end

  def self.get_movies_by_search(search_terms)
    response = conn.get("/3/search/movie?query=#{search_terms}&include_adult=false&language=en-US&page=1") do |req|
      req.params['api_key'] = Rails.application.credentials.movie_db[:key]
    end

    JSON.parse(response.body, symbolize_names: true)[:results]
  end

  def self.get_movie_by_id(movie_id)
    response = conn.get("/3/movie/#{movie_id}?language=en-US") do |req|
      req.params['api_key'] = Rails.application.credentials.movie_db[:key]
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_credits_by_movie_id(movie_id)
    response = conn.get("/3/movie/#{movie_id}/credits?language=en-US") do |req|
      req.params['api_key'] = Rails.application.credentials.movie_db[:key]
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_reviews_by_movie_id(movie_id)
    response = conn.get("/3/movie/#{movie_id}/reviews?language=en-US") do |req|
      req.params['api_key'] = Rails.application.credentials.movie_db[:key]
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end