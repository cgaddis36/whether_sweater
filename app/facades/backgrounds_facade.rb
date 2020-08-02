class BackgroundsFacade
  def initialize(location)
    @location = location
  end

  def serialized_json
    backgrounds_data = Backgrounds.new(backgrounds)
    x = BackgroundsSerializer.new(backgrounds_data)
  end

  private

  def backgrounds
    service = BackgroundsService.new
    parsed = service.get_json(@location.downcase)
    parsed = parsed[:results]
  end
end
