class ApplicationController < ActionController::API
  include ExceptionHandler
  include Pundit

  before_action :set_user_id, only: %i[create destroy update register]
  
  def current_user
    (AuthorizeApiRequest.new(request.headers).call)[:user]
  end

  private

  def set_user_id
    params[:user_id] = current_user.id
  end
end
