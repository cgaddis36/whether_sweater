class TrailsService
  def get_json(location)
    response = conn.get('', {})
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: '')
  end
end
