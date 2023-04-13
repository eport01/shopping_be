class UsersController < ApplicationController
  def create 
    user = User.new(user_params)
    if user.valid? 
      user.save
      session[:user_id] = user.id 
      user.update(api_key: SecureRandom.hex)
      render json: UserSerializer.new(User.last), status: 201 
    end
  end

  def index 
    render json: UserSerializer.new(User.all)
  end

  private 
  def user_params
    params.permit(:name, :email, :password, :api_key)
  end
end
