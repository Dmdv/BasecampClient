class Todolists
  attr_reader :token, :projectid

  # @param [AccessToken] token access token
  def initialize(token, projectid)
    @token = TokenAdapter.new(token)
    @projectid = projectid
  end

  def get_all(id = Account::IDD)
    self.token.get(id, "projects/#{@projectid}/todolists.json")
  end
end