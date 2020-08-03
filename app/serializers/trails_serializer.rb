class TrailsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :distance_to_trail, :location, :name, :summary, :difficulty, :id
end
