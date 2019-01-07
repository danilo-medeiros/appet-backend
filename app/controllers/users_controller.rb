class UsersController < ApplicationController
  before_action :set_user, only: %i[update]

  def signup
    user = User.create!(permit_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = { message: 'Conta criada com sucesso', auth_token: auth_token }
    render json: response, status: :created
  end

  def update
    @user.update(permit_params)
    render json: @user, status: :ok
  end

  private

  def set_user
    @user = current_user
  end

  def permit_params
    params.permit(*permitted_params)
  end

  def permitted_params
    %i[
      name
      email
      password
      password_confirmation
      neighborhood
      city
      state
      postal_code
      phone_number
    ]
  end
end
