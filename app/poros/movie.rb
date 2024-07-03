class Movie

  def initialize(data)
    # require 'pry'; binding.pry
    @title = data[:title]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime]
    @genres = create_genre_array(data[:genres])
    @summary = data[:overview]
    # require 'pry'; binding.pry
  end

  def create_genre_array(genres_list)
    genres_list.map do |genre|
      genre[:name]
    end
  end
end