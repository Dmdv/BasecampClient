require 'Date'

class Todos < BaseToken

  # returns _todo item.
  def get_single(projectid, todoid, id = Account::IDD)
    @token.get(id, "projects/#{projectid}/todos/#{todoid}.json")
  end

  # will create a new _todo from the parameters passed.
  def create(params, projectid, todolistid, id = Account::IDD)

    d = Date.parse(params[:due_at])
    d2 = d.iso8601

    params[:due_at]

    body =
        {
            :content => params[:content],
            :due_at => params[:due_at],
            :assignee =>
                {
                    :id => params[:assignee_id],
                    :type => params[:assignee_type]
                }
        }

    @token.post(id, "projects/#{projectid}/todolists/#{todolistid}/todos.json", JSON.generate(body))

  end

  # updates _todo item.
  def update(params, projectid, todoid, opts = {}, id = Account::IDD)

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

    @token.put(id, "projects/#{projectid}/todos/#{todoid}.json", opts)

  end

  # deletes _todo item.
  def delete(projectid, todoid, id = Account::IDD)
    response = @token.delete(id, "projects/#{projectid}/todos/#{todoid}.json")
    puts ""
  end

end