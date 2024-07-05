class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @movies = MovieFacade.new.get_movies_by_search(params[:search_keywords])
  end

  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.new.get_movie_by_id(params[:id])
    @credits = MovieFacade.new.get_credits_by_movie_id(params[:id])
    @reviews = MovieFacade.new.get_reviews_by_movie_id(params[:id])
  end
end