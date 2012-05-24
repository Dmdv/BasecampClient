module Api
  # https://launchpad.37signals.com/authorization/new?type=web_server&client_id=bc30d9b03da3d18956d388bdb26e75f63dde57c6&redirect_uri=http://myapp.com/oauth
  # http://myapp.com/oauth?code=38c56925

  CLIENTID = 'bc30d9b03da3d18956d388bdb26e75f63dde57c6'
  CLIENTSECRET = '666a6bb8a82e2635995163a9a5bec244c2584b7d'
  REDIRECTURL = 'http://localhost:3000/oauth/request_token'
  SITE = 'https://launchpad.37signals.com/authorization/new'
end

module Basecamp
  PROJECTID = '1831716'
end

module Host
  URL = 'https://basecamp.com'
  POSTFIX = 'api/v1'
end