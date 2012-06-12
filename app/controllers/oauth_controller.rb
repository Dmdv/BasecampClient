class OauthController < ApplicationController
  # gets authorization url
  def login

    #client = Client.create
    #redirect_to client.auth_code.authorize_url(:redirect_uri => Api::REDIRECTURL)

    # TODO:Check token expire date and ccredentials.

    # if AccessToken doesn't exist, redirects to autorization page
    if TokenFactory.any?
      redirect_to :controller => 'projects', :action => 'index'
    else
      client = Client.create
      redirect_to client.auth_code.authorize_url(:redirect_uri => Api::REDIRECTURL)
    end
  end

  # saves code to session and redirects to token creation
  def request_token
    code = params[:code].to_s
    create_token(code)
    # After the code has been received, redirects to projects.
    redirect_to :controller => 'projects', :action => 'index'
  end

  # @param [Integer] code
  def create_token(code)
    client = Client.create
    token = client.auth_code.get_token(code,
                                       :redirect_uri => Api::REDIRECTURL,
                                       :headers => {:Authorization => 'Basic some_password',
                                                    "User-Agent" => '100 Efforts (dimos-d@yandex.ru)',
                                                    :ca_file => Rails.root.join('lib/cert.pem').to_s})
    TokenFactory.update_accesstoken(token)
  end
end

require "api.rb"

# http://developer.37signals.com
# https://github.com/oauth/oauth-ruby
# https://github.com/37signals/bcx-api/blob/master/sections/authentication.md
# https://github.com/37signals/bcx-api
# https://github.com/pelle/oauth
# http://stakeventures.com/articles/2008/02/23/developing-oauth-clients-in-ruby
# https://github.com/pelle/oauth
# https://github.com/anibalcucco/basecamp-wrapper