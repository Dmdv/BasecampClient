class PeopleController < ApplicationController

  attr_reader :people, :opts

  def lib
    @accessor ||= Peoples.new
  end

  def options
    @opts ||= Hash.new
  end

  def index
    options[:caption] = 'All people'
    @people = lib.get_all
  end

  def person
    @people = Array.new
    @people.append(lib.get_person(params[:id]))
  end

  def me
    options[:caption] = 'Me'
    @people = Array.new
    @people.append(lib.get_me)
    render:'people/index'
  end

  def delete
  end

end
