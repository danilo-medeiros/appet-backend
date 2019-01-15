class RefreshToken
  def initialize(headers = {})
    @headers = headers
  end

  def call
    decoded_token = JsonWebToken.decode(http_auth_header, false)
    user = User.find(decoded_token['user_id'])
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_reader :headers

  def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    end
  end
end