class OauthController < ApplicationController

  # gets authorization url
  def login

    # This is used in admin mode, to regenerate new token.
    if Appconfig.change_user
      client = ClientFactory.create
      redirect_to client.auth_code.authorize_url(:redirect_uri => Appconfig.redirect_url)
      return
    end

    # if AccessToken doesn't exist, redirects to autorization page
    if TokenFactory.any?
      redirect_to :controller => 'projects', :action => 'index'
    else
      client = ClientFactory.create
      redirect_to client.auth_code.authorize_url(:redirect_uri => Appconfig.redirect_url)
    end
  end

  # saves code to session and redirects to token creation
  def request_token
    TokenFactory.create_token(params[:code].to_s)
    # After the code has been received, redirects to projects.
    redirect_to :controller => 'projects', :action => 'index'
  end
end

# http://developer.37signals.com
# https://github.com/oauth/oauth-ruby
# https://github.com/37signals/bcx-api/blob/master/sections/authentication.md
# https://github.com/37signals/bcx-api
# https://github.com/pelle/oauth
# http://stakeventures.com/articles/2008/02/23/developing-oauth-clients-in-ruby
# https://github.com/pelle/oauth
# https://github.com/anibalcucco/basecamp-wrapper