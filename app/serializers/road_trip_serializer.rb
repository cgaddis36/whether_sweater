class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :travel_time, :arrival_temp, :summary, :id
end
