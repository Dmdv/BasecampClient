class Peoples < BaseToken

  def get_all
    @token.get("people.json")
  end

  # @param [Int] personid
  def get_person(personid)
    @token.get("people/#{personid}.json")
  end

  def get_me
    @token.get("people/me.json")
  end

  def delete(personid)
    @token.delete("people/#{personid}.json")
  end

end