require 'rails_helper'

describe 'Trails service' do
  it 'can make a successful call' do
    service = TrailsService.new
    expect(service).to be_a(TrailsService)
    json = service.get_json('denver,co')
    expect(json).to be_a(Array)
    expect(json.count).to eq(10)
  end
end
