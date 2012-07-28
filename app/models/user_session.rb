class UserSession
  include PlanoIsdActiveDirectoryAuthentication
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :username, :password

  validates_presence_of :username
  validates_presence_of :password

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def auth
    @auth ||= authenticate(username, password)
  end

  def persisted?
    false
  end
end
