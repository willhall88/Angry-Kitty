Before do
  christmas_day = Date.new(2014, 12, 25)
  @nico = User.create(email: "nico@nicosaueressig.de", password: "12345678", password_confirmation:"12345678")
end

Given(/^I am signed in$/) do
  login_as @nico
end

When(/^I create an event$/) do
  visit('/events/new')
end

When(/^I want to set an event title$/) do
  fill_in 'Title', with: 'Stag Party'
end

When(/^I want to be able to add a brief description$/) do
  fill_in 'Description', with: 'This is the most outrageous party ever'
end

When(/^I want to be able to set a payment deadline$/) do
  fill_in 'Deadline', with: '2014-06-06'
end

When(/^I want to be able to set the anger level$/) do
  select('2', :from => 'Anger level')
end

When(/^I want to be able to set a total payment amount$/) do
  fill_in 'Total', with: 500
end

Then(/^I fill in their name$/) do
  fill_in 'Name', with: 'Zultan'
end

Then(/^I fill in their mobile number$/) do
  fill_in 'Mobile', with: '07740605789'
end

Then(/^I fill in their email$/) do
  fill_in 'Email', with: 'dave@d.com'
end

When(/^I click on submit$/) do
  click_on('Create Event')
end

Then(/^I expect an event with a title, description, payment amount per person and an anger level$/) do
  expect(page).to have_content('Stag Party')
  expect(page).to have_content('This is the most outrageous party ever')
  expect(page).to have_content('2014-06-06')
  expect(page).to have_content('500')
end

Then(/^I expect an invitee with a name, number, email to be created$/) do
  invitee = Userinvitee.first
  expect(invitee.name).to eq 'Zultan'
  expect(invitee.mobile).to eq '07740605789'
  expect(invitee.email).to eq 'dave@d.com'
  expect(page).to have_content('Zultan')
  expect(page).to have_content('07740605789')
  expect(page).to have_content('dave@d.com')
end

# Then(/^I want to be able to add users to the event$/) do
#   pending fill_in 'Name', with: "Zultan"
# end

# Then(/^I want it to be divided automatically by the participants count$/) do
#   pending
# end
