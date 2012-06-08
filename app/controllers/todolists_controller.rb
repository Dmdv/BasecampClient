class TodolistsController < ApplicationController
  attr_accessor :todolists, :remaining, :completed
  attr_reader :projectid
  def index
    @projectid = params[:id]
    token = TokenFactory.get_accesstoken
    todos = Todolists.new(token)
    @todolists = todos.get_all(@projectid)
  end

  def items
    @projectid = params[:id]
    token = TokenFactory.get_accesstoken
    todos = Todolists.new(token)
    @todolists = todos.get_items(@projectid, params[:todoid])
    @remaining = @todolists['todos']['remaining']
    @completed = @todolists['todos']['completed']
  end

  def new
    @list = {}
    @list[:name] = "name"
  end

  def create
  end

  def update
  end

  def delete
  end
end
