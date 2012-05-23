class OauthController < ApplicationController
  # get authorization url
  def login
    redirect_to client.auth_code.authorize_url(:redirect_uri => Api::REDIRECTURL)
  end

  # get code
  def request_token
    session[:code] = params[:code].to_s
  end

  def client
    @options = {:authorize_url => 'https://launchpad.37signals.com/authorization/new',
                :token_url => 'https://launchpad.37signals.com/authorization/token',
                :token_method => :post,
                :raise_errors => true,
                :site => 'https://launchpad.37signals.com'}
    @client ||= BaseClient.new(Api::CLIENTID, Api::CLIENTSECRET, @options)
  end

  # get AccessToken
  def token
    @token ||= client.auth_code.get_token(session[:code],
                                        :redirect_uri => Api::REDIRECTURL,
                                        :headers => {'Authorization' => 'Basic some_password',
                                                     'User-Agent' => '100 Efforts (dimos-d@yandex.ru)'})
                                                    #:ca_file => Rails.root.join('lib/ca-bundle.crt').to_s)
  end

  def authorize
    response = token.get('https://launchpad.37signals.com/authorization.json')
    test = JSON.parse(response.body)
  end
end

# http://oauth.rubyforge.org/
# https://github.com/oauth/oauth-ruby
# https://github.com/37signals/bcx-api/blob/master/sections/authentication.md
# https://github.com/37signals/bcx-api
# https://github.com/pelle/oauth
# http://stakeventures.com/articles/2008/02/23/developing-oauth-clients-in-ruby
# https://github.com/pelle/oauth
# https://github.com/anibalcucco/basecamp-wrapper
# http://developer.37signals.com/