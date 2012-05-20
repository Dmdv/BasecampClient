class OauthController < ApplicationController
  def login

    # http://oauth.rubyforge.org/
    # https://github.com/oauth/oauth-ruby
    # https://github.com/37signals/bcx-api/blob/master/sections/authentication.md
    # https://github.com/37signals/bcx-api
    # https://github.com/pelle/oauth
    # http://stakeventures.com/articles/2008/02/23/developing-oauth-clients-in-ruby
    # https://github.com/pelle/oauth
    # https://github.com/anibalcucco/basecamp-wrapper
    # http://developer.37signals.com/

    @clientid = Api::CLIENTID
    @clientsecret = Api::CLIENTSECRET
    @redirecturl = Api::REDIRECTURL

    @consumer = OAuth::Consumer.new @clientid,
                                    @clientsecret,
                                    { :site => "https://launchpad.37signals.com",
                                      :ca_file => Rails.root.join('lib/ca-bundle.crt').to_s,
                                      :request_token_path => 'https://launchpad.37signals.com/authorization/new',
                                      :access_token_path  => 'https://launchpad.37signals.com/authorization/token',
                                      :redirect_uri       => 'https://localhost:3000/oauth/request_token',
                                      :header => 'User-Agent: Freshbooks (http://freshbooks.com)'}

    #@request_token = OAuth::RequestToken.new(@consumer, session[:request_token], session[:request_token_secret])

    @request_token = @consumer.get_request_token({:oauth_callback => oauth_callback }, :foo => "bar", :header => 'User-Agent: Freshbooks (http://freshbooks.com)')
    redirect_to @request_token.authorize_url

    #@accesstoken = @requesttoken.get_access_token
    #@photos = @accesstoken.get('/photos.xml')

  end

  def oauth_callback
      puts 4
  end

  def request_token
  end

  def access_token
  end

  def authorize
  end
end
