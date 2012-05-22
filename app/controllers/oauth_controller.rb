class OauthController < ApplicationController

  # get access_token and save it
  def callback
    puts "callback"
    access_token = client.get_token(params[:code])
    #current_user.update_attribute(:oauth2_token, access_token.token)
    #flash[:notice] = "Authorized successfully!"
    #redirect_to root_url
  end

  # get authorization code
  def login
    redirect_to client.auth_code.authorize_url(:redirect_uri => Api::REDIRECTURL)
  end

  def client
    puts "client"
    @options = {:authorize_url => 'https://launchpad.37signals.com/authorization/new',
                :token_url => 'https://launchpad.37signals.com/authorization/token',
                :token_method => :post,
                :raise_errors => true,
                :site => 'https://launchpad.37signals.com'}
    @client ||= BaseClient.new(Api::CLIENTID, Api::CLIENTSECRET, @options)
  end

  def oauth_callback
    puts "oauth_callback"
  end

  # TODO: find a place where ssl file to insert
  def request_token
    @token = client.auth_code.get_token(params[:code],
                                        :redirect_uri => Api::REDIRECTURL,
                                        :headers => {'Authorization' => 'Basic some_password',
                                                     'User-Agent' => 'Freshbooks (http://freshbooks.com)'},
                                        :ca_file => Rails.root.join('lib/ca-bundle.crt').to_s)
  end

  def access_token
    puts "access_token"
    #@access_token ||= OAuth2::AccessToken.new(client, current_user.oauth2_token)
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