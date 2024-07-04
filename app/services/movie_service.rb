class MovieService

  # input -> search_terms: string
  # output -> API call repsponse parsed into JSON (array of hashes)
  def self.get_movies_by_search(search_terms)
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers["X-Api-Key"] = Rails.application.credentials.movie_db[:key]
    end

    response = conn.get("/3/search/movie?query=#{search_terms}&include_adult=false&language=en-US&page=1") do |req|
      req.params['api_key'] = Rails.application.credentials.movie_db[:key]
    end

    JSON.parse(response.body, symbolize_names: true)[:results]
  end
end