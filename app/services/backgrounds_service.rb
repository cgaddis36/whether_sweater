class BackgroundsService
  def get_json(location)
    response = conn.get('/search/photos', {client_id: ENV['UNSPLASH_API_KEY'], query: location, content_filter: 'high', orientation: 'landscape'})
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: 'https://api.unsplash.com')
  end
end
