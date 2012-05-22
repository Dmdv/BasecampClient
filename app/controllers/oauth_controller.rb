class OauthController < ApplicationController
  def login
    require 'oauth2'

    test1 = client.auth_code
    test2 = client.token_url

    client.auth_code.authorize_url(:redirect_uri => Api::REDIRECTURL)

    @token = client.auth_code.get_token('authorization_code_value',
                                         :redirect_uri => Api::REDIRECTURL,
                                         :headers => {'Authorization' => 'Basic some_password',
                                                      'User-Agent' => 'Freshbooks (http://freshbooks.com)'})
  end

  def client
      @client ||= OAuth2::Client.new(Api::CLIENTID, Api::CLIENTSECRET,
                                     :site => Api::SITE,
                                     :access_token_url => 'https://launchpad.37signals.com/authorization/token',
                                     :token_url => 'https://launchpad.37signals.com/authorization/token',
                                     :authorize_url => :site)
  end

  def oauth_callback
      puts 4
  end

  def request_token
    puts "callback request"
  end

  def access_token
    @access_token ||= OAuth2::AccessToken.new(client, current_user.oauth2_token)
  end

  def authorize
  end
end


    #@response = token.get('/api/resource', :params => { :query_foo => 'bar' })
    #@response.class.name

    #@consumer = OAuth::Consumer.new @clientid,
    #                                @clientsecret,
    #                                { :site => "https://launchpad.37signals.com",
    #                                  :ca_file => Rails.root.join('lib/ca-bundle.crt').to_s,
    #                                  :request_token_path => 'https://launchpad.37signals.com/authorization/new',
    #                                  :access_token_path  => 'https://launchpad.37signals.com/authorization/token',
    #                                  :redirect_uri       => 'https://localhost:3000/oauth/request_token',
    #                                  :header => 'User-Agent: Freshbooks (http://freshbooks.com)'}

    # http://oauth.rubyforge.org/
    # https://github.com/oauth/oauth-ruby
    # https://github.com/37signals/bcx-api/blob/master/sections/authentication.md
    # https://github.com/37signals/bcx-api
    # https://github.com/pelle/oauth
    # http://stakeventures.com/articles/2008/02/23/developing-oauth-clients-in-ruby
    # https://github.com/pelle/oauth
    # https://github.com/anibalcucco/basecamp-wrapper
    # http://developer.37signals.com/