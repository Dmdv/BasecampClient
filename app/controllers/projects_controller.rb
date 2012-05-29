class ProjectsController < ApplicationController
  attr_reader :projects, :name, :description
  attr_accessor :newproject
  def index
    token = TokenFactory.get_accesstoken
    @projects = Projects.new(token).get_all

    #response = token.get('https://launchpad.37signals.com/authorization.json')
    #@autorizeinfo = JSON.parse(response.body)
  end

  def get
  end

  def new
    @newproject = Project.new
  end

  def update
  end

  def archive
  end

  def delete
  end
end
