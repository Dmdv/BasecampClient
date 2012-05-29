module Api
  CLIENTID = 'bc30d9b03da3d18956d388bdb26e75f63dde57c6'
  CLIENTSECRET = '666a6bb8a82e2635995163a9a5bec244c2584b7d'
  REDIRECTURL = 'http://localhost:3000/oauth/request_token'
  SITE = 'https://launchpad.37signals.com/authorization/new'

  # @param [Integer] id  project id
  # @param [String] path query path from basecamp api.
  def form_url(id, path)
    "#{Host::URL}/#{id}/#{Host::POSTFIX}/#{path}"
  end
end

module ProjectParams
  IDD = '1831716'
end

module Host
  URL = 'https://basecamp.com'
  POSTFIX = 'api/v1'
end