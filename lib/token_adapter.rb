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

  def put(id, path, body)
    url = form_url(id, path)
    request = @token.put(url) do |req|
      req.headers['Content-Type'] = 'application/json'
      req.headers['charset'] = 'utf-8'
      req.body = body
    end

    JSON.parse(request.body)
  end

  # How to make post request in Faraday
  # https://github.com/technoweenie/faraday

  #   @connection.post do |req|
  #     req.url 'http://localhost', 'a' => '1' # 'http://localhost?a=1'
  #     req.headers['b'] = '2' # Header
  #     req.params['c']  = '3' # GET Param
  #     req['b']         = '2' # also Header
  #     req.body = 'abc'
  #   end

  # Another way:
  #opts[:headers] ||= {}
  #opts[:headers]["Content-Type"] = 'application/json'
  #opts[:headers]["charset"] = 'utf-8'
  #opts[:body] = JSON.generate({ :name => 'Bob3', :description => 'sample descr' })
  #request = @token.post(url, opts)

  def post(id, path, body)
    url = form_url(id, path)
    request = @token.post(url) do |req|
      req.headers['Content-Type'] = 'application/json'
      req.headers['charset'] = 'utf-8'
      req.body = body
    end

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