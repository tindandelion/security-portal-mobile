Given /^there's a user$/ do |table|
  user_info = OpenStruct.new(table.rows_hash)
  backend.create_company user_info.company do |company|
    company.add_user user_info.login, user_info.password
  end
end

When /^a user "([^"]*)" logs in with password "([^"]*)"$/ do |login, password|
  start_application
  login_as login, password
end

Then /^a summary page for company "([^"]*)" is displayed$/ do |company|
  home_screen.should be_visible
  home_screen.company.should eq(company)
end

Then /^the user "([^"]*)" with password "([^"]*)" is verified on the server$/ do |username, password|
  verify_validated_user username, password
end

Then /^the login error is shown$/ do
  login_screen.should be_visible
  should have_shown_error(:title => 'Login error', :text => 'Invalid user name or password')
end