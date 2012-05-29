class Client
  # To change this template use File | Settings | File Templates.
  def self.create
    @options = {:authorize_url => 'https://launchpad.37signals.com/authorization/new',
                :token_url => 'https://launchpad.37signals.com/authorization/token',
                :token_method => :post,
                :raise_errors => true,
                :site => 'https://launchpad.37signals.com'}
    @client ||= BaseClient.new(Api::CLIENTID, Api::CLIENTSECRET, @options)
  end
end