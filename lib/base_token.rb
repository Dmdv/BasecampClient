class BaseToken

  attr_reader :access_token

  def initialize
    begin
      @access_token = TokenFactory.get_accesstoken
    rescue
      TokenFactory.update_accesstoken(access_token)
      @access_token = TokenFactory.get_accesstoken
    end
    @token = TokenAdapter.new(access_token)
  end

  # TODO: How to employ auth to check if the user is wrong and update token in DB
  # response = @token.get('https://launchpad.37signals.com/authorization.json')

end