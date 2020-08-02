class Backgrounds
  attr_reader :id, :url
  def initialize(attributes)
    @id = nil
    @url = attributes[0][:urls][:raw]
  end
end
