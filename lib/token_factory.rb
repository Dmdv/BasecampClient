class TokenFactory

  # @param [Integer] code
  # This code is received during 2 round oauth authorization.
  def self.create_token(code)
    raise ArgumentError, "code is nill in TokenFactory.create_token" if code.nil?

    client = ClientFactory.create
    token = client.auth_code.get_token(code,
                                       :redirect_uri => Appconfig.redirect_url,
                                       :headers => {:Authorization => 'Basic some_password',
                                                    "User-Agent" => '100 Efforts (dimos-d@yandex.ru)',
                                                    :ca_file => Rails.root.join('lib/cert.pem').to_s})
    update_accesstoken(token)
  end

  # @return [AccessToken]
  def self.get_accesstoken
    tok = Token.first
    raise ArgumentError, "Token is nill in TokenFactory.get_accesstoken" if tok.nil?

    token = OAuth2::AccessToken.from_hash(
        ClientFactory.create, {:access_token => tok.token,
                        :refresh_token => tok.refresh_token,
                        :expires_in => tok.expires_in,
                        :expires_at => tok.expires_at }
    )

    if token.expired?
      puts "Token expired, refreshing..."
      newtoken = token.refresh! :type => "refresh"
      token = update_accesstoken(newtoken, tok)
    end

    token
  end

  # @return [Boolean]
  def self.any?
    Token.any?
  end

  private

    # @param [AccessToken] token Updates AccessToken on autorization.
  def self.update_accesstoken(token, old_token = nil)
    raise ArgumentError, "Token is nill in TokenFactory.update_accesstoken" if token.nil?

    unless old_token.nil?
      old_tok = Token.find_by_expires_at old_token.expires_at
      unless old_tok.nil?
        old_tok.delete
      end
    end

    if Appconfig.change_user
      cur_token = Token.first
      unless cur_token.nil?
        cur_token.delete
      end
    end

    # TODO: Save Account Idd in DB.
    response = token.get('https://launchpad.37signals.com/authorization.json')
    body = JSON.parse(response.body)

    Token.create(
        token: token.token,
        refresh_token: token.refresh_token,
        expires_in: token.expires_in,
        expires_at: token.expires_at)
    token
  end

end