class ApplicationController < ActionController::API
  before_action :authorize_request, only: %i[create destroy update]
  
  attr_reader :current_user

  private

  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end
end
