module Settings
  CLIENTID = '033e1be1c051167958a4ecac9792b4b353e10098'
  CLIENTSECRET = 'a4fe920e7604a6a4ceacababd98114ffac03b93d'
  REDIRECTURL = 'http://localhost:3000/oauth/request_token'
  SITE = 'https://launchpad.37signals.com/authorization/new'
  CHANGEUSER = TRUE

  # @param [String] path query path from basecamp api.
  def form_url(path)
    "#{Host::URL}/#{Account::IDD}/#{Host::POSTFIX}/#{path}"
  end

  module Account
    IDD = '1884058' #project ID
    #IDD = '1937153' # this ID is created with registering in basecamp.
  end

  module Host
    URL = 'https://basecamp.com'
    POSTFIX = 'api/v1'
  end
end

