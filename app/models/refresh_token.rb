class RefreshToken < ActiveRecord::Base
  attr_accessible :expires_at, :token
end
