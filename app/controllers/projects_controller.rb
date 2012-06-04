class ProjectsController < ApplicationController
  attr_reader :projects
  attr_accessor :project

  def index
    token = TokenFactory.get_accesstoken
    array = Projects.new(token).get_all
    @projects = Array.new
    array.each do |project|
      proj = Project.new
      proj.id           = project['id']
      proj.name         = project['name']
      proj.description  = project['description']
      proj.created_at   = project['created_at']
      proj.updated_at   = project['updated_at']
      proj.url          = project['url']
      @projects.append(proj)
    end
    @projects
    #response = token.get('https://launchpad.37signals.com/authorization.json')
    #@autorizeinfo = JSON.parse(response.body)
  end

  def get
  end

  # this is used when button creat clicked
  def new
    @project = Project.new

    respond_to do |format|
      format.html
      format.json { render json: @project }
    end
  end

  def update
  end

  def archive
  end

  def delete
  end

  # this is to process POST message from form
  def create
    puts "test"
  end
end
