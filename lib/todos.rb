require 'Date'

class Todos < BaseToken

  # returns _todo item.
  def get_single(projectid, todoid)
    @token.get("projects/#{projectid}/todos/#{todoid}.json")
  end

  # will create a new _todo from the parameters passed.
  def create(params, projectid, todolistid)

    data = params[:due_at]
    data = Date.parse(data.to_a.sort.collect{|c| c[1]}.join("-"))

    body =
        {
            :content => params[:content],
            :due_at => data,
            :assignee =>
                {
                    :id => params[:assignee_id],
                    :type => params[:assignee_type]
                }
        }

    @token.post("projects/#{projectid}/todolists/#{todolistid}/todos.json", JSON.generate(body))

  end

  # updates _todo item.
  def update(params, projectid, todoid, opts = {})

    opts[:body] = JSON.generate(
        {
            :content  => params[:content],
            :due_at   => params[:due_at],
            :assignee =>
                {
                    :id => params[:assignee_id],
                    :type => params[:assignee_type]
                },
            :completed => params[:completed]
        }
    )

    @token.put("projects/#{projectid}/todos/#{todoid}.json", opts)

  end

  # deletes _todo item.
  def delete(projectid, todoid)
    @token.delete("projects/#{projectid}/todos/#{todoid}.json")
  end
end