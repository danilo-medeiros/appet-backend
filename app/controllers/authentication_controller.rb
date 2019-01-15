class AuthenticationController < ApplicationController

  def authenticate
    auth_token = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    if auth_token.nil?
      head :unauthorized
      return
    end
    render json: { token: auth_token }
  end

  def register
    @user = current_user
    render 'auth/register'
  end

  def refresh
    begin
      render json: { token: request.headers['Authorization'] } if current_user
    rescue JWT::ExpiredSignature
      new_token = RefreshToken.new(request.headers).call
      head :unauthorized if new_token.nil?
      render json: { token: new_token }
    end
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end
