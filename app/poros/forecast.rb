class Forecast
  attr_reader :id, :current, :hourly, :daily
  def initialize(weather)
    @id = nil
    @current = weather[:current]
    @hourly = weather[:hourly]
    @daily = weather[:daily]
  end
end
