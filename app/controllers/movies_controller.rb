class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @movies = MovieFacade.new.get_movies_by_search(params[:search_keywords])
  end

  def show
    #hit the api to get the movie details
    @user = User.find(params[:user_id])

    # movie_data = MovieService.get_movie_by_id(movie_id)
    # @movie = Movie.new(movie_data)

    @movie = MovieFacade.new.get_movie_by_id(params[:id])


    # credit_data = MovieService.get_credits_by_movie_id(params[:id])
    # @credits = Credit.new(credit_data)
    @credits = MovieFacade.new.get_credits_by_movie_id(params[:id])

    # review_data = MovieService.get_reviews_by_moviezs_id(params[:id])
    # @reviews = Review.new(review_data)
    @reviews = MovieFacade.new.get_reviews_by_movie_id(params[:id])

  end
end