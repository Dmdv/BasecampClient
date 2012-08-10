class Todolists < BaseToken

  # Will return all todolists with remaining todos on them sorted by position
  # @param [Integer] projectid returns project by id
  def get_all(projectid)
    get("projects/#{projectid}/todolists.json")
  end

  # will return all the todolists with todos assigned to the specified person.
  def get_all_withassigned(projectid)
    get("projects/#{projectid}/assigned_todos.json")
  end

  # Will return all the completed todolists
  def get_completed(projectid)
    get("projects/#{projectid}/todolists/completed.json")
  end

  # Will return the specified todolist including the todos
  # /projects/341806/todolists/803532.json
  def get_items(projectid, todolistid)
    get("projects/#{projectid}/todolists/#{todolistid}.json")
  end

  # will create a new todolist from the parameters passed.
  def create(name, description, projectid)
    body = {:name => name, :description => description}
    post("projects/#{projectid}/todolists.json", JSON.generate(body))
  end
end