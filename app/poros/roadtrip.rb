class Roadtrip
  attr_reader :id, :location, :current_temp, :description, :trails
  def initialize(attributes)
    @id = nil
    @location = attributes[:location]
    @current_temp = attributes[:current_temp]
    @description = attributes[:description]
    @trails  = attributes[:trails]
  end
end
