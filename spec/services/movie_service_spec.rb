require 'rails_helper'

RSpec.describe MovieService do
  describe '.get_movies_by_search' do
    it 'returns an array of movies' do
      search_terms = 'Avengers'

      movies = MovieService.get_movies_by_search(search_terms)

      expect(movies).to be_an(Array)
      expect(movies.length).to be > 0
      expect(movies.first).to have_key(:title)
      expect(movies.first).to have_key(:overview)
    end
  end

  describe '.get_movie_by_id' do
    it 'returns a movie' do
      movie_id = 9732

      movie = MovieService.get_movie_by_id(movie_id)

      expect(movie).to be_a(Hash)
      expect(movie).to have_key(:title)
      expect(movie).to have_key(:overview)
    end
  end

  describe '.get_credits_by_movie_id' do
    it 'returns credits for a movie' do
      movie_id = 9732

      credits = MovieService.get_credits_by_movie_id(movie_id)

      expect(credits).to be_a(Hash)
      expect(credits).to have_key(:cast)
      expect(credits).to have_key(:crew)
    end
  end

  describe '.get_reviews_by_movie_id' do
    it 'returns reviews for a movie' do
      movie_id = 9732

      reviews = MovieService.get_reviews_by_movie_id(movie_id)

      expect(reviews).to be_a(Hash)
      expect(reviews).to have_key(:results)
    end
  end

  describe '.get_watch_providers' do
    it 'returns watch providers for a movie' do
      movie_id = 9732

      watch_providers = MovieService.get_watch_providers(movie_id)

      expect(watch_providers).to be_a(Hash)
      expect(watch_providers).to have_key(:link)
    end
  end
end