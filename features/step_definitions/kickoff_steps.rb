When(/^a user starts the application$/) do
  start_application
end

Then(/^a web page with title "([^"]*)" is shown$/) do |title|
  browser.title.should == title
end

