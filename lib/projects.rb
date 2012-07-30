# Projects
class Projects < BaseToken

  # @param [Project IDD] id project id
  def get_all
    begin
      @token.get('projects.json')
    rescue Exception => ex
      puts "Exception:"
      puts ex.message
      ex.raise
    end
  end

  # @param [Integer] projectid returns project by id
  def get_single(projectid)
    @token.get("projects/#{projectid}.json")
  end

  # @param [Integer] projectid deletes project by id
  def delete(projectid)
    @token.delete("projects/#{projectid}.json")
  end

  def create(name, description)
    body = {:name => name, :descrption => description}
    @token.post('projects.json', JSON.generate(body))
  end

  def update(projectid, name, description)
    body = {:name => name, :descrption => description}
    @token.put("projects/#{projectid}.json", JSON.generate(body))
  end

  #def todo_lists(projectid)
  #  todos = Todolists.new(@token)
  #  todos.get_all(projectid)
  #end

  def archive
  end
end