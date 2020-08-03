class RoadtripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location, :current_temp, :description, :trails, :id
end
