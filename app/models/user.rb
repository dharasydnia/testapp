class User < ActiveRecord::Base
  has_many :clients
  has_many :authorization_codes
  has_many :access_tokens

  attr_accessible :email, :first_name, :group_strings, :guid, :last_name, :login, :name

  def self.find_or_create(attributes)
    user = User.find_by_guid(attributes[:guid])

    if user
      attributes.delete(:guid)
      user.update_attributes(attributes)
    else
      user = User.create(attributes)
    end
    return user
  end
end
