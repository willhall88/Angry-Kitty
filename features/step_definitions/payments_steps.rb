Given(/^I have one paid user$/) do
  @user = create(:user, email: 'user@user.com')
  @user2 = create(:user, email: 'user2@user2.com')
  @event = create(:event, organiser: @user)
  @debt = create(:debt, user_id: @user.id, event_id: @event.id, paid: true)
  login_as @user
end

Given(/^I have one unpaid user$/) do
  @debt2 = create(:debt, user_id: @user2.id, event_id: @event.id, paid: false)
end

Then(/^I should see a list of paid and a list of unpaid participants$/) do
  expect(page).to have_content "user@user.com | ✓"
  expect(page).to have_content "user2@user2.com | ✗"
end