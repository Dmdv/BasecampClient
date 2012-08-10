class BaseToken
  attr_reader :access_token

  def initialize
    @access_token = TokenFactory.get_accesstoken
    if self.access_token.nil?
      raise ArgumentError, "Token is nill in BaseToken.initialize"
    end
  end

  def get(path, opts = {})
    url = form_url(path)
    request = @access_token.get(url, opts)
    JSON.parse(request.body)
  end

  def put(path, body)
    url = form_url(path)
    request = @access_token.put(url) do |req|
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

  def post(path, body)
    url = form_url(path)
    request = @access_token.post(url) do |req|
      req.headers['Content-Type'] = 'application/json'
      req.headers['charset'] = 'utf-8'
      req.body = body
    end
    JSON.parse(request.body)
  end

  # @param [String] path url path
  def delete(path)
    url = form_url(path)
    response = @access_token.delete(url)
    # if response.env[:status] = 204
  end
end