Given(/^I have an event$/) do
  @event = create(:event, organiser: @nico)
end

And(/^I have one paid user$/) do
  @user = create(:user, email: 'user@user.com')
  @debt = create(:debt, user_id: @user.id, event_id: @event.id, paid: true)
end

Given(/^I have one unpaid user$/) do
  @user2 = create(:user, email: 'user2@user2.com')
  @debt2 = create(:debt, user_id: @user2.id, event_id: @event.id, paid: false)
end

Then(/^I should see a list of paid and a list of unpaid participants$/) do
  expect(page).to have_content "user@user.com | ✓"
  expect(page).to have_content "user2@user2.com | ✗"
end

Given(/^I am an organiser$/) do
  login_as @nico
end

When(/^I click on 'Paid' button next to that unpaid participant$/) do
  expect(current_path).to eq event_path(@event)
  click_on('Paid')
  
end

Then(/^I should see the user has paid$/) do
  expect(page).to have_content "user2@user2.com | ✓"
end