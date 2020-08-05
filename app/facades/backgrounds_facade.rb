class BackgroundsFacade
  def initialize(location)
    @location = location
  end

  def serialized_json
    BackgroundsSerializer.new(backgrounds_data)
  end

  private

  def backgrounds_data
    Backgrounds.new(parsed_backgrounds)
  end

  def parsed_backgrounds
    service = BackgroundsService.new
    service.get_json(@location.downcase)
  end
end
