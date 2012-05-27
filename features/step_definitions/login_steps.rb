When /^a user "([^"]*)" logs in with password "([^"]*)"$/ do |login, password|
  start_application
  login_as login, password
end

Then /^the user "([^"]*)" with password "([^"]*)" is verified on the server$/ do |username, password|
  verify_validated_user username, password
end

Then /^the login error is shown$/ do
  login_screen.should be_visible
  should have_shown_error(:title => 'Login error', :text => 'Invalid user name or password')
end