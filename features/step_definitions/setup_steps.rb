Given /^there's a user|company$/ do |table|
  user_info = OpenStruct.new(table.rows_hash)
  backend.with_company user_info.company do |company|
    company.add_user user_info.login, user_info.password
  end
end

Given /^the environment summary for company "([^"]*)" is$/ do |company_name, table|
  backend.with_company company_name do |company|
    company.summary = summary_from(table.rows_hash)
  end
end

def summary_from(summary_hash)
  res = summary_hash.collect { |key, value| [key.to_sym, value.to_i] }
  Hash[*res.flatten]
end