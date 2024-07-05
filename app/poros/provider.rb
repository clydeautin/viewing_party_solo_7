class Provider

  attr_reader :provider_id, :provider_name, :logo_path

  def initialize(data)
    # require 'pry'; binding.pry
    @provider_id = data[:provider_id] if data
    @provider_name = data[:provider_name] if data
    @logo_path = data[:logo_path] if data
  end

  def valid?
    !@provider_id.nil? && !@provider_name.nil? && !@logo_path.nil?
  end
end