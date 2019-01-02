class AuthenticateUser
  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    user = find_user
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_reader :email, :password

  def find_user
    user = User.find_by(email: email)
    return user if user && user.authenticate(password)
  end
end