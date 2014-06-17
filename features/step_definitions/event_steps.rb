Given(/^I am signed in and on the dashboard$/) do
  nico = User.create(email: "nico@nicosaueressig.de", password: "12345678", password_confirmation:"12345678")
  login_as nico
  visit '/events'
  expect(current_path).to eq('/events')
end

When(/^I click New Event$/) do
  click_on('New Event')
end

When(/^I fill in the event details$/) do
    # page.should have_content('Title') # async
    within('#myModal') {
    fill_in 'event[title]', with: 'Stag Party'
    fill_in 'event[description]', with: 'This is the most outrageous party ever'
    fill_in 'event[total]', with: 500
    fill_in 'event[deadline]', with: '2014-06-06'
    select('angry', :from => 'event[angerlevel]') }
end

When(/^I fill in the first invitees name, mobile and email details$/) do
  within('#myModal') {
  first('li').fill_in 'event[userinvitees_attributes][0][email]', with: 'dave@d.com'
  first('li').fill_in 'Name', with: 'Zultan'
  first('li').fill_in 'Mobile', with: '07740605789' }
end

When(/^I click Create Event$/) do
  click_on('Create Event')
end

When(/^I click on Add Friend$/) do
  click_on 'Add Friend'
end

When(/^I fill in the second invitees name, mobile and email details$/) do
 within '.userinvitees_list li:last-child' do
    fill_in 'Email', with: 'daffyduck@test.com'
    fill_in 'Name', with: 'Daffy'
    fill_in 'Mobile', with: '07753205999'
  end
end

When(/^I do not fill in the second invitees name, mobile and email details$/) do
  within '.userinvitees_list li:last-child' do
    fill_in 'Email', with: ''
    fill_in 'Name', with: ''
    fill_in 'Mobile', with: ''
  end
end

Then(/^I expect to see the dashboard contain the new event with its title and description$/) do
  expect(page).to have_content('STAG PARTY')
  expect(page).to have_content('DUE IN')
end

Then(/^I expect an invitee with a name, number, email to be created$/) do
  invitee = Userinvitee.first
  expect(invitee.name).to eq 'Zultan'
  expect(invitee.mobile).to eq '07740605789'
  expect(invitee.email).to eq 'dave@d.com'
end

Then(/^I expect two invitees with their names, numbers, and emails to be created$/) do
  invitee2 = Userinvitee.second
  expect(invitee2.name).to eq 'Daffy'
  expect(invitee2.mobile).to eq '07753205999'
  expect(invitee2.email).to eq 'daffyduck@test.com'
end



