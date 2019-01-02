class ApplicationController < ActionController::API
  before_action :authorize_request, only: %i[create destroy update register]
  
  attr_reader :current_user

  private

  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
    params[:user_id] = @current_user.id
  end
end
