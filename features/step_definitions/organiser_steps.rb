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
  within('#myModall') do
    fill_in 'userinvitee[name]', with: 'Marco'
    fill_in 'userinvitee[email]', with: 'marco@marco.com'
    fill_in 'userinvitee[mobile]', with: '87654321'
    click_on('Save changes')
  end
end

Then(/^I want to be able to see the changes$/) do
  expect(current_path).to eq "/events/#{@event.id}"
end