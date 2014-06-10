Before do
  christmas_day = Date.new(2014, 12, 25)
  @user = User.create(email: "nico@nicosaueressig.de", password: "12345678", password_confirmation:"12345678")
end

Given(/^I am signed in$/) do
  login_as @user
end

When(/^I create an event$/) do
  visit('/events/new')
end

Then(/^I want to set an event title$/) do
  fill_in 'Title', with: 'Stag Party'
  click_on('Create Event')
  expect(page).to have_content('Stag Party')
end

Then(/^I want to be able to add a brief description$/) do
  fill_in 'Description', with: 'This is the most outrageous party ever'
  click_on('Create Event')
  expect(page).to have_content('This is the most outrageous party ever')
end

Then(/^I want to be able to set a payment deadline$/) do
  fill_in 'Deadline', with: "2014-06-06"
  click_on('Create Event')
  expect(page).to have_content('Event created for 2014-06-06')
end

Then(/^I want to be able to set the anger level$/) do
  select('2', :from => 'Anger level')
  click_on('Create Event')
  expect(page).to have_content('Anger Level: 2')
end

Then(/^I want to be able to set a total payment amount$/) do
  fill_in 'Total', with: "500"
  click_on('Create Event')
  expect(page).to have_content("500")
end

Then(/^I want to be able to add users to the event$/) do
  pending fill_in 'Name', with: "Zultan"
end

Then(/^I want it to be divided automatically by the participants count$/) do
  
end

Then(/^fill in their name$/) do
  fill_in 'Name', with: "Zultan"
  click_on('Create Event')
  expect(page).to have_content("Zultan")
end


Then(/^fill in their mobile number$/) do
  fill_in 'Mobile', with: "07740605789"
  click_on('Create Event')
  expect(page).to have_content("07740605789")
end

Then(/^fill in their email$/) do
  fill_in 'Email', with: "dave@d.com"
  click_on('Create Event')
  expect(page).to have_content("dave@d.com")
end


