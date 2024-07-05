require "rails_helper"

RSpec.describe MovieFacade do

  describe "#get_movies_by_search" do
    it "returns an array of movie objects when given search keywords" do
      facade = MovieFacade.new
      response = facade.get_movies_by_search("The Matrix")


      expect(response).to be_an(Array)
      expect(response).to all(be_a(Movie)) 
      
      response.each do |movie|
        expect(movie.title).to be_a(String)
        expect(movie.summary).to be_a(String)
        expect(movie.vote_average).to be_a(Float)
      end
    end
  end

  describe "#get_movie_by_id" do
    it "returns a movie object when given a movie ID" do
      facade = MovieFacade.new
      response = facade.get_movie_by_id(603)

      expect(response).to be_a(Movie)
      expect(response.title).to be_a(String)
      expect(response.summary).to be_a(String)
      expect(response.vote_average).to be_a(Float)
    end
  end

  describe "#get_credits_by_movie_id" do
    it "returns a credit object when given a movie ID" do
      facade = MovieFacade.new
      response = facade.get_credits_by_movie_id(603)

      expect(response).to be_a(Credit)
      expect(response.actors).to be_an(Array)
    end
  end

  describe "#get_reviews_by_movie_id" do
    it "returns a review object when given a movie ID" do
      facade = MovieFacade.new
      response = facade.get_reviews_by_movie_id(603)

      expect(response).to be_a(Review)
      expect(response.review_author_info).to be_a(Array)
      expect(response.review_count).to be_a(Integer)
    end
  end

  describe "#get_buy_providers" do
    it "returns an array of provider objects for buying options when given a movie ID" do
      facade = MovieFacade.new
      response = facade.get_buy_providers(603)

      expect(response).to be_an(Array)
      expect(response).to all(be_a(Provider))

      response.each do |provider|
        expect(provider.provider_name).to be_a(String)
        expect(provider.logo_path).to be_a(String)
      end
    end

    it "returns an empty array if no buy provider data is available" do
      facade = MovieFacade.new
      response = facade.get_buy_providers(67890)

      expect(response).to eq([])
    end
  end

  describe "#get_rent_providers" do
    it "returns an array of provider objects for renting options when given a movie ID" do
      facade = MovieFacade.new
      response = facade.get_rent_providers(9732)

      expect(response).to be_an(Array)
      expect(response).to all(be_a(Provider))

      response.each do |provider|
        expect(provider.name).to be_a(String)
        expect(provider.logo_path).to be_a(String)
      end
    end

    it "returns an empty array if no rent provider data is available" do
      facade = MovieFacade.new
      response = facade.get_rent_providers(67890)

      expect(response).to eq([])
    end
  end
end