class Roadtrip
  attr_reader :id, :location, :current_temp, :description, :trails
  def initialize(attributes)
    @id = nil
    @location = attributes[:location]
    @current_temp = attributes[:current_temp]
    @description = attributes[:description]
    @trails  = attributes[:trails]
  end

  def distance_service
    service = LocationService.new
    service = service.get_directions(@start_location, @location)
  end
end
