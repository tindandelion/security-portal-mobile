When /^a user "([^"]*)" logs in with password "([^"]*)"$/ do |username, password|
  start_application
  login_as :username => username, :password => password
end

Then /^a summary page for user "([^"]*)" is displayed$/ do |username|
  should be_on_home_screen
  current_user.should == username
end