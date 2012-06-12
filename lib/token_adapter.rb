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

  # How to make post request in Faraday
  # https://github.com/technoweenie/faraday
  def post(id, path, opts = {})
    url = form_url(id, path)

    request = @token.post(url) do |request|
      request.options = opts
      request.headers['Content-Type'] = 'application/json'
      request.headers['charset'] = 'utf-8'
      request.body = opts[:body]
    end

    JSON.parse(request.body)

    # Example:
    #opts[:headers] ||= {}
    #opts[:headers]["Content-Type"] = 'application/json'
    #opts[:headers]["charset"] = 'utf-8'
    #opts[:body] = JSON.generate({ :name => 'Bob3', :description => 'sample descr' })
    #request = @token.post(url, opts)
  end

  # @param [Integer] id project id
  # @param [String] path url path
  def delete(id, path, opts = {})
    url = form_url(id, path)
    request = @token.delete(url, opts)
    #JSON.parse(request.body)
  end
end