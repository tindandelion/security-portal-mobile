When /^a user "([^"]*)" logs in with password "([^"]*)"$/ do |username, password|
  start_application
  login_as :username => username, :password => password
end

Then /^a summary page for user "([^"]*)" is displayed$/ do |username|
  should be_on_home_screen
  current_user.should == username
end

Then /^the user "([^"]*)" with password "([^"]*)" is verified on the server$/ do |username, password|
  verify_validated_user username, password
end

Then /^the login error is shown$/ do
  pending # express the regexp above with the code you wish you had
end