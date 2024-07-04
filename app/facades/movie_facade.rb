class MovieFacade
  def initialize()

  end

  def get_movies_by_search(search_terms)
    json = MovieService.get_movies_by_search(search_terms)

    json.map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def get_movie_by_id(movie_id)
    movie_data = MovieService.get_movie_by_id(movie_id)
    Movie.new(movie_data)
  end

  def get_credits_by_movie_id(movie_id)
    credit_data = MovieService.get_credits_by_movie_id(movie_id)
    Credit.new(credit_data)
  end

  def get_reviews_by_movie_id(movie_id)
    review_data = MovieService.get_reviews_by_movie_id(movie_id)
    Review.new(review_data)
  end
end