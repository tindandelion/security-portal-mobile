Then /^a summary page for company "([^"]*)" is displayed$/ do |name|
  home_screen.should be_visible
  home_screen.company_name.should eq(name)
end

Then /^the summary page should display$/ do |expected_summary|
  expected_summary.diff!(home_screen.summary)
end