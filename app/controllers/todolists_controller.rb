class TodolistsController < ApplicationController
  def index
    projectid = params[:id]
    token = TokenFactory.get_accesstoken
    Todolists.new(token, projectid).get_all
  end
end