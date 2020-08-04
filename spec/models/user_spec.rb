require 'rails_helper'

RSpec.describe User, type: :model do
  it 'validations' do
    should { validate_presence_of :email }
    should { validate_presence_of :api_key }
  end
end
