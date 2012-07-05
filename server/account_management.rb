module AccountManagement
  attr_accessor :last_validated_user
  
  class Company
    attr_accessor :name
    attr_accessor :summary
    
    def initialize(name)
      @name = name
      @users = Hash.new
      @summary = {
        :critical => 0, 
        :warning => 0,
        :protected => 0
      }
    end
    
    def add_user(login, password)
      @users[login] = password
    end
    
    def has_login?(login)
      @users.has_key?(login)
    end
    
    def password_for_login(login)
      @users[login]
    end
    
    def valid_user?(login, password)
      return false unless has_login?(login)
      password_for_login(login) == password
    end
  end
  
  def companies
    @companies ||= Array.new
  end
  
  def with_company(name, &block)
    company = companies.find { |c| c.name = name }
    unless company
      company = Company.new(name)
      @companies << company
    end
    
    block.call(company) if block
  end
  
  def company_for_login(login, password)
    companies.find {|company| company.valid_user?(login, password)}
  end
  
  def password_for_login(login)
    companies.each do |c|
      return c.password_for_login(login) if c.has_login?(login)
    end
  end
  
  def reset
    @last_validated_user = nil
    @companies = nil
  end
end
