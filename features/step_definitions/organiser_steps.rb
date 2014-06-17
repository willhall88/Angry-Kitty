Given(/^I have created an event$/) do
  @user = create(:user)
  login_as @user
  @invitee = create(:userinvitee)
  @event = build(:event, organiser: @user)
  @event.userinvitees << @invitee
  @event.save
end

Given(/^I click on the event$/) do
  visit '/events/'
  click_on("#{@event.id}")
end

When(/^I edit a participant$/) do
  click_on('Edit')
  fill_in 'Name', with: 'Marco'
  fill_in 'Email', with: 'marco@marco.com'
  fill_in 'Mobile', with: '87654321'
  click_on('Save changes')
end

Then(/^I want to be able to see the changes$/) do
  expect(current_path).to eq "/events/#{@event.id}"
end