# Projects
class Projects
  attr_reader :token

  # @param [AccessToken] token access token
  def initialize(token)
    @token = TokenAdapter.new(token)
  end

  # @param [Project IDD] id project id
  def get_all(id = Account::IDD)
    self.token.get(id, 'projects.json')
  end

  # @param [Integer] projectid returns project by id
  def get_single(projectid, id = Account::IDD)
    self.token.get(id, "projects/#{projectid}.json")
  end

  # @param [Integer] projectid deletes project by id
  def delete(projectid, id = Account::IDD)
    self.token.delete(id, "projects/#{projectid}.json")
  end

  def create(id = Account::IDD, name, description)
    opts = {:name => name, :descrption => description}
    self.token.post(id, 'projects.json', opts)
  end

  def update(projectid, name, description, id = Account::IDD)
    opts = {:name => name, :descrption => description}
    self.token.put(id, "projects/#{projectid}.json", opts)
  end

  def todo_lists(projectid)
    todos = Todolists.new(@token)
    todos.get_all(projectid)
  end

  def archive
  end
end