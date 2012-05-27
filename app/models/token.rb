class Token < ActiveRecord::Base
  attr_accessible :expire_at, :expire_in, :refresh_token, :token
end
