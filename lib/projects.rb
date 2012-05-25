# Projects
class Projects
  attr_reader :token

  # @param [AccessToken] token access token
  def initialize(token)
    @token = TokenAdapter.new(token)
  end

  # @param [Project IDD] id project id
  def get_all(id = Project::IDD)
    self.token.get(id, 'projects.json')
  end

  # @param [Integer] projectid returns project by id
  def get_single(projectid, id = Project::IDD)
    self.token.get(id, "projects/#{projectid}.json")
  end

  # @param [Integer] projectid returns project by id
  def delete(projectid, id = Project::IDD)
    self.token.delete(id, "projects/#{projectid}.json")
  end
end