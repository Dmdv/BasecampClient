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

  # /projects/341806/todolists/803532.json
  def get_items(projectid, todolistid, id = Account::IDD)
    @token.get(id, "projects/#{projectid}/todolists/#{todolistid}.json")
  end

  def get_completed(projectid, id = Account::IDD)
    @token.get(id, "projects/#{projectid}/todolists/completed.json")
  end

  def get_assigned

  end
end