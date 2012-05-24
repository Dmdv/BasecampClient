class Projects
  PATH = 'projects.json'
	attr_reader :token

  # @param [AccessToken] token
  def initialize(token)
    @token = token
    @path = "#{Host::URL}/#{Basecamp::PROJECTID}/#{Host::POSTFIX}/#{PATH}"
    @projects = @token.get(@path)
	end
end