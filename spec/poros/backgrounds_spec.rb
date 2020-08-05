require 'rails_helper'

RSpec.describe Backgrounds do
  it "can create a backgrounds PORO" do
    attributes = [ {:urls=>
                    {:raw=>"https://images.unsplash.com/photo-1581378670696-6bb27d6e450b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE1MzczNH0",
                    :full=>"https://images.unsplash.com/photo-1581378670696-6bb27d6e450b?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjE1MzczNH0"}},
                    {:urls=>
                    {:raw=>"https://images.unsplash.com/photo-1581378670696-6bb27d7e450b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE1MzczNH0",
                    :full=>"https://images.unsplash.com/photo-1581378670696-6bb47d6e450b?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjE1MzczNH0"}},
                    {:urls=>
                    {:raw=>"https://images.unsplash.com/photo-1581378670696-6bb27d7e450b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE1MzczNH0",
                    :full=>"https://images.unsplash.com/photo-1581378670696-6bb47d6e450b?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjE1MzczNH0"}},
                    {:urls=>
                    {:raw=>"https://images.unsplash.com/photo-1581378670696-6bb27d7e450b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE1MzczNH0",
                    :full=>"https://images.unsplash.com/photo-1581378670696-6bb47d6e450b?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjE1MzczNH0"}},
                    {:urls=>
                    {:raw=>"https://images.unsplash.com/photo-1581378670696-6bb27d7e450b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE1MzczNH0",
                    :full=>"https://images.unsplash.com/photo-1581378670696-6bb47d6e450b?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjE1MzczNH0"}},
                    {:urls=>
                    {:raw=>"https://images.unsplash.com/photo-1581378670696-6bb27d7e450b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE1MzczNH0",
                    :full=>"https://images.unsplash.com/photo-1581378670696-6bb47d6e450b?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjE1MzczNH0"}},
                    {:urls=>
                    {:raw=>"https://images.unsplash.com/photo-1581378670696-6bb27d7e450b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE1MzczNH0",
                    :full=>"https://images.unsplash.com/photo-1581378670696-6bb47d6e450b?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjE1MzczNH0"}},
                    {:urls=>
                    {:raw=>"https://images.unsplash.com/photo-1581378670696-6bb27d7e450b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE1MzczNH0",
                    :full=>"https://images.unsplash.com/photo-1581378670696-6bb47d6e450b?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjE1MzczNH0"}},
                    {:urls=>
                    {:raw=>"https://images.unsplash.com/photo-1581378670696-6bb27d7e450b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE1MzczNH0",
                    :full=>"https://images.unsplash.com/photo-1581378670696-6bb47d6e450b?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjE1MzczNH0"}
                    } ]

    background = Backgrounds.new(attributes)

    expect(background).to be_a(Backgrounds)
  end
end
