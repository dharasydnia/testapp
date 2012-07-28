class Client < ActiveRecord::Base
  attr_accessible :description, :identifier, :name, :redirect_uri, :secret, :website
end
