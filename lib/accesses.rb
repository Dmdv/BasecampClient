class Accesses < BaseToken

  # @param [Int] projectid Project ID
  def get_projects_people(projectid)
    @token.get("projects/#{projectid}/accesses.json")
  end

  # @param [Int] calendarid Calendar ID
  def get_calendars_people(calendarid)
    @token.get("calendars/#{calendarid}/accesses.json")
  end

  def grant_project_access(projectid, ids = [], emails = [])
    raise ArgumentError, "ids is not an array" unless ids.kind_of?(Array)
    raise ArgumentError, "emails is not an array" unless emails.kind_of?(Array)
    return if ids.empty? && emails.empty?

    body = { :ids => ids, :email_addresses => emails }
    @token.post("projects/#{projectid}/accesses.json", JSON.generate(body))
  end

  def grant_calendar_access(calendarid, ids = [], emails = [])
    raise ArgumentError, "ids is not an array" unless ids.kind_of?(Array)
    raise ArgumentError, "emails is not an array" unless emails.kind_of?(Array)
    return if ids.empty? && emails.empty?

    body = { :ids => ids, :email_addresses => emails }
    @token.post("calendars/#{calendarid}/accesses.json", JSON.generate(body))
  end

  def revoke_project_access(projectid, personid)
    @token.delete("projects/#{projectid}/accesses/#{personid}.json")
  end

  def revoke_calendar_access(projectid, personid)
    @token.delete("calendars/#{projectid}/accesses/#{personid}.json")
  end

end