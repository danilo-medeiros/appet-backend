class AuthenticationController < ApplicationController

  def authenticate
    auth_token = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    render json: { token: auth_token }
  end

  def register
    @user = current_user
    render 'auth/register'
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end
