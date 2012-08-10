class BasecampAuthcode < OAuth2::Strategy::AuthCode
  # The required query parameters for the authorize URL
  #
  # @param [Hash] params additional query parameters
  # @see http://tools.ietf.org/html/draft-ietf-oauth-v2-05#section-3.6.1
  def authorize_params(params={})
    params.merge(:type => 'web_server', :client_id => @client.id)
  end

  # Retrieve an access token given the specified validation code.
  #
  # @param [String] code The Authorization Code value
  # @param [Hash] params additional params
  # @param [Hash] opts options
  # @note that you must also provide a :redirect_uri with most OAuth 2.0 providers
  def get_token(code, params={}, opts={})
    params = {:type => 'web_server', :code => code}.merge(client_params).merge(params)
    @client.get_token(params, opts)
  end

end

require "oauth2"
require "oauth2/client"