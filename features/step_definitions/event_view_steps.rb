 Given(/^I am a user$/) do
  @user = create(:user)
  login_as @user
end

Given(/^I make an event$/) do
  @invitee = create(:userinvitee)
  @event = build(:event, organiser: @user)
  @event.userinvitees << @invitee
  @event.save
  visit '/'
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
  expect(page).to have_content("Mark as paid")
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

When(/^I am on the event view page$/) do
  first(".col-md-4.post").click
  expect(current_path).to eq("/events/#{@event.id}")
end

When(/^I click on "(.*?)"$/) do |arg1|
  click_on arg1
end


Then(/^the event will be deleted$/) do
  expect(current_path).to eq "/"
  expect(page).not_to have_content "REVENGE OF THE HALFLINGS"
end



