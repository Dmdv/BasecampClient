class BaseToken

  attr_reader :access_token

  def initialize
    @access_token = TokenFactory.get_accesstoken
    if self.access_token.nil?
      raise ArgumentError, "Token is nill in BaseToken.initialize"
    end
    @token = TokenAdapter.new(self.access_token)
  end

  # TODO: How to employ auth to check if the user is wrong and update token in DB
  # response = @token.get('https://launchpad.37signals.com/authorization.json')

end