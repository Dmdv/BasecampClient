# Projects
class Projects < BaseToken

  # @param [Project IDD] id project id
  def get_all
    get('projects.json')
  end

  # @param [Integer] projectid returns project by id
  def get_single(projectid)
    get("projects/#{projectid}.json")
  end

  # @param [Integer] projectid deletes project by id
  def delete(projectid)
    super("projects/#{projectid}.json")
  end

  def create(name, description)
    body = {:name => name, :descrption => description}
    post('projects.json', JSON.generate(body))
  end

  def update(projectid, name, description)
    body = {:name => name, :descrption => description}
    put("projects/#{projectid}.json", JSON.generate(body))
  end

  #def todo_lists(projectid)
  #  todos = Todolists.new(@token)
  #  todos.get_all(projectid)
  #end

  def archive
  end
end