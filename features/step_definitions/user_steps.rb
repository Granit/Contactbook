Given /^the following (.+) records?$/ do |factory, table|
  table.hashes.each do |hash|
    puts hash
    User.create!(hash)
  end
end

Given /^I am logged in as "([^\"]*)" with password "([^\"]*)"$/ do |username, password|
  unless username.blank?
    visit login_url
    fill_in "Username", :with => username
    fill_in "Password", :with => password
    click_button "Log in"
  end
end

When /^I visit profile for "([^\"]*)"$/ do |username|
  user = User.find_by_username!(username)
  visit user_url(user)
end

Given /^I am sign up as "([^\"]*)" with email "([^\"]*)" and password "([^\"]*)"$/ do |login, email, password|
  unless login.blank?
    visit signup_url
    fill_in "Login", :with => login
    fill_in "Email", :with => email
    fill_in "Password", :with => password
    fill_in "Confirm Password", :with => password
    click_button "Sign up"
  end
end

Given /^I am filling contact form with Name "([^\"]*)", Lastname "([^\"]*)", Firstname "([^\"]*)", Middlename "([^\"]*)", Email "([^\"]*)", Phone number "([^\"]*)", Address "([^\"]*)"$/ do |name, lastname, firstname, middlename, email, phone_number, address|
    fill_in "kontakt_name", :with => name
    fill_in "kontakt_lastname", :with => lastname
    fill_in "kontakt_firstname", :with => firstname
    fill_in "kontakt_middlename", :with => middlename
    fill_in "kontakt_email", :with => email
    fill_in "kontakt_phone_number", :with => phone_number
    fill_in "kontakt_address", :with => address
    click_button "Save"
end

Given /^I am filling login form with Login "([^"]*)" and Password "([^"]*)"$/ do |login, password|
    fill_in "login", :with => login
    fill_in "password", :with => password
    click_button "Log in"
end

Then /^I should have ([0-9]+) contact of User "([^\"]*)"$/ do |count, user_login|
  user_id = User.find_by_login(user_login)
  Kontakt.find_all_by_user_id(user_id).count == count.to_i
end

Then /^I count "([^\"]*)"$/ do |tablename|
  puts "#{tablename}="+tablename.capitalize.constantize.all.count.to_s
end


