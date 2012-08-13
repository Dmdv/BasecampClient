require 'Settingslogic'

class Appconfig < Settingslogic
  source "#{Rails.root}/config/basecamp.yml"
  namespace Rails.env
end