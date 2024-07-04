class Movie

  attr_reader :title, :vote_average, :runtime, :genres, :summary, :runtime_h_m, :id

  def initialize(data)
    @title = data[:title]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime]
    @runtime_h_m = runtime_in_hours_and_minutes
    @genres = create_genre_array(data[:genres])
    @summary = data[:overview]
    @id = data[:id]
  end

  def create_genre_array(genres_list)
    genres_list.map do |genre|
      genre[:name]
    end
  end

  def runtime_in_hours_and_minutes
    hours = @runtime / 60
    minutes = @runtime % 60
    "#{hours}h #{minutes} mins"
  end

  def find_by_id(id)
    
  end
end