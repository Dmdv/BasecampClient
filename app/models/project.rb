class Project
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_accessor :name, :description

  def initialize
    @name = ""
    @description = ""
  end

  def persisted?
      false
  end
end