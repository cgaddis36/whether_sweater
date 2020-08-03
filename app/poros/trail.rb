class Trail
  attr_reader :id
  def initialize(attributes, location)
    @id = nil
    @name = attributes[:name]
    @summary = attributes[:summary]
    @location  = attributes[:location]
    @start_location = location
    @distance_to_trail = distance_service
  end

  def distance_service
    service = LocationService.new
    service = service.get_directions(@start_location, @location)
  end
end
