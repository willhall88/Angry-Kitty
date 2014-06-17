 Given(/^I am a user$/) do
  @user = create(:user)
  login_as @user
end

Given(/^I make an event$/) do
  @invitee = create(:userinvitee)
  @event = build(:event, organiser: @user)
  @event.userinvitees << @invitee
  @event.save
end

Then(/^I see "(.*?)"$/) do |arg1|
  expect(page).to have_content(arg1)
end

Given(/^the event has (\d+) participant who has not paid$/) do |arg1|
  @unpaid_ppt = create(:user, email: 'unpaid@user.com')
  @event.users << @unpaid_ppt
  @event.save
end

Then(/^I want to see that the participant has not paid$/) do
  expect(page).to have_content("Unpaid")
end

Given(/^the event has (\d+) participant who has paid$/) do |arg1|
  @paid_ppt = create(:user, email: 'paid@user.com')
  @event.users << @paid_ppt
  @event.save
  @paid_ppt.debts.last.update(paid: true)
end

Then(/^I see that the participant has paid$/) do
  expect(page).to have_content("Paid")
end

Given(/^the event has (\d+) invitee who has not accepted$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end


