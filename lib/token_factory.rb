class TokenFactory

  # @param [Integer] code
  # This code is received during 2 round oauth authorization.
  def self.create_token(code)
    if code.nil?
      raise ArgumentError, "code is nill in TokenFactory.create_token"
    end

    client = Client.create
    token = client.auth_code.get_token(code,
                                       :redirect_uri => Api::REDIRECTURL,
                                       :headers => {:Authorization => 'Basic some_password',
                                                    "User-Agent" => '100 Efforts (dimos-d@yandex.ru)',
                                                    :ca_file => Rails.root.join('lib/cert.pem').to_s})
    update_accesstoken(token)
  end

  # @param [AccessToken] token Updates AccessToken on autorization.
  def self.update_accesstoken(token)
    if token.nil?
      raise ArgumentError, "Token is nill in TokenFactory.update_accesstoken"
    end

    tok = Token.create(token: token.token, refresh_token: token.refresh_token,
                       expires_in: token.expires_in, expires_at: token.expires_at)
    unless tok.nil?
      Token.delete_all
      tok.save
    end
    token
  end

  # @return [AccessToken]
  def self.get_accesstoken
    tok = Token.first

    if tok.nil?
      raise ArgumentError, "Token is nill in TokenFactory.get_accesstoken"
    end

    opts = { :access_token => tok.token,
             :refresh_token => tok.refresh_token,
             :expires_in => tok.expires_in,
             :expires_at => tok.expires_at }
    token = OAuth2::AccessToken.from_hash(Client.create, opts)

    if token.expired?
      puts "Token expired, refreshing..."
      update_accesstoken token.refresh! type: "refresh"
    end
  end

  # @return [Boolean]
  def self.any?
    Token.any?
  end
end