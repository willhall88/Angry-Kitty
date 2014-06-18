Given(/^there is an event with a due date and participants$/) do
  userinvitee = create(:userinvitee)
  organiser = create(:user)
  user = create(:user, email: 'user@user.com')
  event = create(:event, organiser: organiser)
  event.userinvitees << userinvitee
  @debt = create(:debt, user_id: user.id, event_id: event.id)
end

Then(/^the participant will receive the email and it will contain a link to make payment$/) do
  ChasersMailer.harass(@debt).deliver!
  open_email(@debt.user.email)
  expect(current_email).to have_content "PAY NOW"
  expect(current_email).to have_link "PAY NOW"
end

Then(/^they click the payment link$/) do
  current_email.click_link "PAY NOW"
end

Then(/^they will be on the payments page$/) do
  expect(current_path).to eq "/users/#{@debt.user_id}/#{@debt.event_id}/charges/new"
end

