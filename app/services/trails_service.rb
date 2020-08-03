class TrailsService
  def get_json(location)
    service = LocationService.new
    lat_lng = service.get_json(location)
    response = conn.get('/data/get-trails', {lat: lat_lng[:lat].to_s, lon: lat_lng[:lng].to_s, maxDistance: '50', key: ENV['HIKING_PROJECT_API_KEY']})
    parsed = JSON.parse(response.body, symbolize_names: true)
    trails = parsed[:trails].map do |trail|
      Trail.new(trail, location)
    end
  end

  private

  def conn
    Faraday.new(url: 'https://www.hikingproject.com')
  end
end

# https://www.hikingproject.com/data/get-trails?lat=40.0274&lon=-105.2519&maxDistance=10&key=200861552-163a00ddf4561dd5c91e6d3be2685320
