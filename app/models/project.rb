# used only to publish data in the view.
class Project
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_accessor :id, :name, :description, :url, :created_at, :updated_at, :url

  def initialize
    @name = ""
    @description = ""
  end

  def persisted?
      false
  end
end