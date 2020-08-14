require 'rails_helper'

RSpec.describe User, type: :model do
  it 'validations' do
    should { validate_uniqueness_of :email }
    should { validate_uniqueness_of :api_key }
    #this is a comment
  end
end
