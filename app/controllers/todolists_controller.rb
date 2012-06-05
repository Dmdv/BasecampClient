class TodolistsController < ApplicationController
  attr_accessor :todolists
  def index
    token = TokenFactory.get_accesstoken
    todos = Todolists.new(token)
    projectid = params[:id]
    array = todos.get_all(projectid)
    array.each do |todo|
    end
    @todolists = array
  end

  def new
  end

  def create
  end

  def update
  end

  def delete
  end
end
