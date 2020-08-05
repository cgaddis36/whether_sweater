class BackgroundsFacade
  def initialize(location)
    @location = location
  end

  def serialized_json
    backgrounds_data = Backgrounds.new(backgrounds)
    BackgroundsSerializer.new(backgrounds_data)
  end

  private

  def backgrounds
    service = BackgroundsService.new
    parsed = service.get_json(@location.downcase)
    parsed[:results]
  end
end
