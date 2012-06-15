class ProjectsController < ApplicationController

  attr_accessor :project, :projects

  def lib
    @accessor ||= Projects.new
  end

  def index
    @projects = lib.get_all
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
