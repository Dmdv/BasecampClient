class TodolistsController < ApplicationController

  attr_reader :opts

  def index
    options[:caption] = 'All Todo lists'
    options[:projectid] = params[:id]
    options[:todolists] = todos.get_all(params[:id])
  end

  def index_completed
    options[:caption] = 'Completed Todo lists'
    options[:projectid] = params[:id]
    options[:todolists] = todos.get_completed(params[:id])
    render :template => 'todolists/index'
  end

  def items
    options[:projectid] = params[:id]
    todolist = todos.get_items(params[:id], params[:todoid])

    options[:todolist]  = todolist
    options[:remaining] = todolist['todos']['remaining']
    options[:completed] = todolist['todos']['completed']
  end

  def new
    options[:projectid]   = params[:id]
    options[:name]        = "enter name"
    options[:description] = "enter description"
  end

  def new_item
    options[:projectid]   = params[:id]
  end

  def create
    options[:projectid]   = params[:projectid]
    options[:todolist]    = todos.create(params[:name], params[:description], params[:projectid])
  end

  def create_item
    options[:projectid]   = params[:projectid]
    #options[:todolist]    = todos.create(params[:name], params[:description], params[:projectid])
  end

  def update
  end

  def delete
  end

  def options
    @opts ||= Hash.new
  end

  def todos
    token = TokenFactory.get_accesstoken
    Todolists.new(token)
  end
end