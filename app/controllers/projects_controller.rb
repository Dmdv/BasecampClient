class ProjectsController < ApplicationController

  attr_accessor :project, :projects

  def projects
    @accessor ||= Projects.new
  end

  def index
    @projects = projects.get_all

    # TODO: How to employ auth to check if the user is wrong and update token in DB
    # response = @token.get('https://launchpad.37signals.com/authorization.json')
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
