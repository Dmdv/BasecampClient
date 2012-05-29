class TokenFactory
  # @param [AccessToken] token Updates AccessToken on autorization.
  def self.update_accesstoken(token)
    Token.delete_all
    tok = Token.create(token: token.token, refresh_token: token.refresh_token,
                       expires_in: token.expires_in, expires_at: token.expires_at)
    tok.save
  end

  # @return [AccessToken]
  def self.get_accesstoken
    tok = Token.first
    opts = {:access_token => tok.token, :refresh_token => tok.refresh_token, :expires_in => tok.expires_in, :expires_at => tok.expires_at}
    OAuth2::AccessToken.from_hash(Client.create, opts)
  end

  # @return [Boolean]
  def self.any?
    Token.any?
  end
end