class Credit

  def initialize(data)
    @actors = create_actor_array(data[:cast])
  end

  def create_actor_array(data)
    actors = []
    data.map do |cast_details|
      if cast_details[:known_for_department] == "Acting"
        actors << cast_details[:name]
      end
    end
  end
end