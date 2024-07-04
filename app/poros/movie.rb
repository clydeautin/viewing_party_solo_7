class Movie

  attr_reader :title, :vote_average, :runtime, :genres, :summary, :runtime_h_m, :id, :runtime_hh_mm

  def initialize(data)
    @title = data[:title]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime]
    @runtime_h_m = runtime_in_hours_and_minutes
    @runtime_hh_mm = minutes_to_time
    @genres = create_genre_array(data[:genres])
    @summary = data[:overview]
    @id = data[:id]
  end

  def create_genre_array(genres_list)
    if genres_list.nil?
      nil
    else
      genres_list.map do |genre|
        genre[:name]
      end
    end
  end

  def runtime_in_hours_and_minutes
    # require 'pry'; binding.pry
    if @runtime.nil?
      0
    else
      hours = @runtime / 60
      minutes = @runtime % 60
      "#{hours}h #{minutes} mins"
    end
  end

  def minutes_to_time
    if @runtime.nil?
      0
    else
      hours = @runtime / 60
      mins = @runtime % 60
      Time.parse("#{hours}:#{mins}")
    end
  end
end