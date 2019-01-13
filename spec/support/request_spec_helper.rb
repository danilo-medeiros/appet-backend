module RequestSpecHelper
  def json
    JSON.parse(response.body)
  end

  def authenticate(user)
    service = AuthenticateUser.new(user.email, user.password)
    service.call
  end
end