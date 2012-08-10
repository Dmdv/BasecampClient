class Peoples < BaseToken

  def get_all
    get("people.json")
  end

  # @param [Int] personid
  def get_person(personid)
    get("people/#{personid}.json")
  end

  def get_me
    get("people/me.json")
  end

  def delete(personid)
    super("people/#{personid}.json")
  end

end