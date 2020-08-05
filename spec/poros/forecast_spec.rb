require 'rails_helper'

RSpec.describe Forecast do
  it "can create a forecast PORO" do

    attributes =  {:lat=>38.27,
                   :lon=>-104.61,
                   :timezone=>"America/Denver",
                   :timezone_offset=>-21600,
                   :current=>
                    {:dt=>1596586380,
                     :sunrise=>1596542635,
                     :sunset=>1596593100,
                     :temp=>86.11,
                     :feels_like=>75.25,
                     :pressure=>1016,
                     :humidity=>29,
                     :dew_point=>50.16,
                     :uvi=>10.89,
                     :clouds=>1,
                     :visibility=>10000,
                     :wind_speed=>19.46,
                     :wind_deg=>120,
                     :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]},
                   :hourly=>
                    [{:dt=>1596585600,
                      :temp=>86.11,
                      :feels_like=>81.05,
                      :pressure=>1016,
                      :humidity=>29,
                      :dew_point=>50.16,
                      :clouds=>1,
                      :visibility=>10000,
                      :wind_speed=>9.17,
                      :wind_deg=>68,
                      :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
                      :pop=>0.1}]}

    forecast = Forecast.new(attributes)

    expect(forecast).to be_a(Forecast)
  end
end
