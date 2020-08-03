class UsersFacade
  def initialize(user_params)
    @user_params = user_params
  end

  def serialized_json
    if @user_params["password"] == @user_params["password_confirmation"]
      user = User.create(email: @user_params["email"], api_key: SecureRandom.uuid)
    end
    x = UsersSerializer.new(user)
  end
end
