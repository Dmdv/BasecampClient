class Token < ActiveRecord::Base
  attr_accessible :token, :refresh_token, :expires_in, :expires_at
end