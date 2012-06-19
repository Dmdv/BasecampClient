# Projects
class Projects < BaseToken

  # @param [Project IDD] id project id
  def get_all(id = Account::IDD)
    @token.get(id, 'projects.json')
  end

  # @param [Integer] projectid returns project by id
  def get_single(projectid, id = Account::IDD)
    @token.get(id, "projects/#{projectid}.json")
  end

  # @param [Integer] projectid deletes project by id
  def delete(projectid, id = Account::IDD)
    @token.delete(id, "projects/#{projectid}.json")
  end

  def create(name, description, id = Account::IDD)
    body = {:name => name, :descrption => description}
    @token.post(id, 'projects.json', JSON.generate(body))
  end

  def update(projectid, name, description, id = Account::IDD)
    body = {:name => name, :descrption => description}
    @token.put(id, "projects/#{projectid}.json", JSON.generate(body))
  end

  #def todo_lists(projectid)
  #  todos = Todolists.new(@token)
  #  todos.get_all(projectid)
  #end

  def archive
  end
end