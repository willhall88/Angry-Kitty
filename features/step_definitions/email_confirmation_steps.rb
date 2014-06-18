Given(/^I have completed payment$/) do
  userinvitee = create(:userinvitee)
  organiser = create(:user)
  user = create(:user, email: 'user@user.com')
  event = build(:event, organiser: organiser)
  event.userinvitees << userinvitee
  event.save
  @debt = create(:debt, user_id: user.id, event_id: event.id)
end

Then(/^they should receive a receipt by email$/) do
  ConfirmationMailer.receipt(@debt).deliver!
  open_email(@debt.user.email)
  expect(current_email).to have_content "Payment confirmed"
end

Then(/^the organiser should receive an email notification$/) do
  ConfirmationMailer.notification(@debt).deliver!
  open_email(@debt.event.organiser.email)
  expect(current_email).to have_content "You have been paid"
end


