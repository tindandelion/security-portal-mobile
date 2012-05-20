module UserValidation
  attr_accessor :last_validated_user
  
  def users 
    @users ||= Hash.new
  end
  
  def add_user(name, password)
    users[name] = password
  end
  
  def valid_credentials?(creds)
    name = creds["username"]
    password = creds["password"]
    
    return false unless users.has_key?(name)
    return users[name] == password
  end
  
  def reset
    @last_validated_user = nil
    @users = nil
  end
end
