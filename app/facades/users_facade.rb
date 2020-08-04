class UsersFacade
  def initialize(user_params)
    @user_params = user_params
  end

  def serialized_json
    user = User.create(@user_params)
    UsersSerializer.new(user)
  end
end
