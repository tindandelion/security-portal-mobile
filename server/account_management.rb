module AccountManagement
  attr_accessor :last_validated_user
  
  class Company
    attr_accessor :name
    attr_accessor :summary
    
    def initialize(name)
      @name = name
      @users = Hash.new
    end
    
    def add_user(login, password)
      @users[login] = password
    end
    
    def valid_user?(login, password)
      return false unless @users.has_key?(login)
      @users[login] == password
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
  
  def reset
    @last_validated_user = nil
    @companies = nil
  end
end
