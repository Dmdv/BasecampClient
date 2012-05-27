class TokenAdapter
  include Api
  attr_reader :token

  # @param [AccessToken] token access token
  def initialize(token)
    @token = token
  end

  # @param [Integer] id project id
  # @param [String] path url path
  def get(id, path, opts = {})
    url = form_url(id, path)
    request = @token.get(url, opts)
    JSON.parse(request.body)
  end

  def put(id, path, opts = {})
    url = form_url(id, path)
    request = @token.put(url, opts)
    JSON.parse(request.body)
  end

  def post(id, path, opts = {})
    url = form_url(id, path)
    request = @token.post(url, opts)
    JSON.parse(request.body)
  end

  # @param [Integer] id project id
  # @param [String] path url path
  def delete(id, path, opts = {})
    url = form_url(id, path)
    request = @token.delete(url, opts)
    #JSON.parse(request.body)
  end
end