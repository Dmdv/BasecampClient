class People < BaseToken

  def get_all(id = Account::IDD)
    @token.get(id, "people.json")
  end

  def get_person(personid, id = Account::IDD)
    @token.get(id, "people/#{personid}.json")
  end


  def get_me(id = Account::IDD)
    @token.get(id, "people/me.json")
  end

  def delete(personid, id = Account::IDD)
    @token.delete(id, "people/#{personid}.json")
  end

end