class BaseClient < OAuth2::Client
  def auth_code
    @auth_code ||= BasecampAuthcode.new(self)
  end
end

require "oauth2"
require "oauth2/client"