class Backgrounds
  attr_reader :id, :url
  def initialize(attributes)
    @id = nil
    @url = attributes[rand(0..9)][:urls][:raw]
  end
end
