class TodolistsController < ApplicationController
  def index
    token = TokenFactory.get_accesstoken
    todos = Todolists.new(token)
    projectid = params[:id]
    todos.get_all(projectid)
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
