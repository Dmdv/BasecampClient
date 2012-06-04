class Todolists
  attr_reader :token

  # @param [AccessToken] token access token
  def initialize(token)
    @token = TokenAdapter.new(token)
  end

  # @param [Integer] projectid returns project by id
  def get_all(projectid, id = Account::IDD)
    @token.get(id, "projects/#{projectid}/todolists.json")
  end
end