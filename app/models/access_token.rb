class AccessToken < ActiveRecord::Base
  attr_accessible :expires_at, :token
end
