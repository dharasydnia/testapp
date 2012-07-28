require 'net/ldap'

module PlanoIsdActiveDirectoryAuthentication

  def authenticate(username, password)
    return nil if username.empty?
    return nil if password.empty?

    @ldap_connection = Net::LDAP.new(
      :host => "ldap01.pisd.edu",
      :base => "OU=PISD,DC=ad,DC=pisd,DC=edu",
      :port => 636,
      :encryption => :simple_tls,
      :auth => {
        :username => username,
        :password => password,
        :method => :simple
      }
    )

    if @ldap_connection.bind
      @ldap_entry = @ldap_connection.search(:filter => Net::LDAP::Filter.eq('sAMAccountName', username)).first
      return {
        :email => @ldap_entry[:mail].first,
        :first_name => @ldap_entry[:givenname].first,
        :last_name => @ldap_entry[:sn].first,
        :login => @ldap_entry[:samaccountname].first,
        :guid => @ldap_entry[:objectguid].first.unpack("H*").first,
        :name => @ldap_entry[:displayname].first,
        :group_strings => @ldap_entry[:memberof].collect{ |g| g.sub(/.*?CN=(.*?),.*/, '\1') }
      }
    else
      nil
    end
  end
end
