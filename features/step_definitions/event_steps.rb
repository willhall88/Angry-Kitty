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

When(/^I want to be able to add a description$/) do
  fill_in 'Description', with: 'This is the most outrageous party ever'
end

When(/^I want to be able to set a payment deadline$/) do
  fill_in 'Deadline', with: '2014-06-06'
end

When(/^I want to be able to set the anger level$/) do
  select('angry', :from => 'Anger level')
end

When(/^I want to be able to set a total payment amount$/) do
  fill_in 'Total', with: 500
end

When(/^I fill in the invitees email$/) do
  # fill_in 'Email', with: 'dave@d.com'
  first('li').fill_in 'Email', with: 'dave@d.com'
end

When(/^I fill in the invitees name$/) do
  # fill_in 'Name', with: 'Zultan'
  first('li').fill_in 'Name', with: 'Zultan'
end

When(/^I fill in the invitees mobile number$/) do
  # fill_in 'Mobile', with: '07740605789'
  first('li').fill_in 'Mobile', with: '07740605789'
end

When(/^I click on Add Friend$/) do
  click_on 'Add Friend'
end

When(/^I fill in the second invitees email$/) do
  within '.userinvitees_list li:last-child' do
    fill_in 'Email', with: 'daffyduck@test.com'
  end
end

When(/^I fill in the second the invitees name$/) do
  within '.userinvitees_list li:last-child' do
    fill_in 'Name', with: 'Daffy'
  end
end

When(/^I fill in the second invitees mobile number$/) do
  within '.userinvitees_list li:last-child' do
    fill_in 'Mobile', with: '07753205999'
  end
end

When(/^I click on submit$/) do
  click_on('Create Event')
end

Then(/^I expect to see the dashboard contain the new event with its title and description$/) do
  expect(page).to have_content('Stag Party')
  expect(page).to have_content('2014-06-06')
end

Then(/^I expect an invitee with a name, number, email to be created$/) do
  invitee = Userinvitee.first
  expect(invitee.name).to eq 'Zultan'
  expect(invitee.mobile).to eq '07740605789'
  expect(invitee.email).to eq 'dave@d.com'
end

Then(/^I expect two invitees with their names, numbers, and emails to be created$/) do
  invitee = Userinvitee.second
  expect(invitee.name).to eq 'Daffy'
  expect(invitee.mobile).to eq '07753205999'
  expect(invitee.email).to eq 'daffyduck@test.com'
end




