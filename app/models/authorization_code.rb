class AuthorizationCode < ActiveRecord::Base
  attr_accessible :expires_at, :redirect_uri, :token
end
