class TodolistsController < ApplicationController

  attr_accessor :opts

  def lib
    @todos ||= Todolists.new
  end

  def options
    @opts ||= Hash.new
  end

  def index
    options[:caption] = 'All Todo lists'
    options[:projectid] = params[:id]

    options[:todolists] = lib.get_all(params[:id])
  end

  def index_completed
    options[:caption] = 'Completed Todo lists'
    options[:projectid] = params[:id]

    options[:todolists] = lib.get_completed(params[:id])
    render :template => 'todolists/index'
  end

  def items
    options[:caption] = 'Todolist items'
    options[:projectid] = params[:id]

    todolist = lib.get_items(params[:id], params[:todoid])
    options[:todolist] = todolist
    options[:remaining] = todolist['todos']['remaining']
    options[:completed] = todolist['todos']['completed']
  end

  def new
    options[:projectid] = params[:id]
    options[:name] = "enter name"
    options[:description] = "enter description"
  end

  def create
    options[:projectid] = params[:projectid]
    options[:todolist] = lib.create(params[:name], params[:description], params[:projectid])
  end

  def new_item
    options[:projectid] = params[:id]
    options[:people] = Peoples.new.get_all.collect {|p| [ p["name"], p["id"] ] }

    # possible way to create in view.
    # Peoples.new.get_all {|p| [ p.name, p.id ] }
    puts ""
  end

  def create_item

    pars = {}
    pars[:content]  = params[:content]
    pars[:due_at]   = params[:due_at]
    pars[:assignee_id]  = params[:assignee_id]
    pars[:assignee_type]  = "Person"

    Todos.new.create(pars, params[:projectid], params[:todolistid])
  end

  def update
  end

  def delete
  end
end