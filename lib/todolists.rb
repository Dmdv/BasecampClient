class Todolists < BaseToken

  # Will return all todolists with remaining todos on them sorted by position
  # @param [Integer] projectid returns project by id
  def get_all(projectid, id = Account::IDD)
    @token.get(id, "projects/#{projectid}/todolists.json")
  end

  # will return all the todolists with todos assigned to the specified person.
  def get_all_withassigned(projectid, id = Account::IDD)
    @token.get(id, "projects/#{projectid}/assigned_todos.json")
  end

  # Will return all the completed todolists
  def get_completed(projectid, id = Account::IDD)
    @token.get(id, "projects/#{projectid}/todolists/completed.json")
  end

  # Will return the specified todolist including the todos
  # /projects/341806/todolists/803532.json
  def get_items(projectid, todolistid, id = Account::IDD)
    @token.get(id, "projects/#{projectid}/todolists/#{todolistid}.json")
  end

  # will create a new todolist from the parameters passed.
  def create(name, description, projectid, opts = {}, id = Account::IDD)
    opts[:body] = JSON.generate({:name => name, :description => description})
    @token.post(id, "projects/#{projectid}/todolists.json", opts)
  end
end