Given(/^I have completed payment$/) do
  organiser = create(:user)
  user = create(:user, email: 'user@user.com')
  event = create(:event, organiser: organiser)
  @debt = create(:debt, user_id: user.id, event_id: event.id)
end

Then(/^they should receive a receipt by email$/) do
  p "debt: #{@debt.inspect}"
  ConfirmationMailer.receipt(@debt).deliver!
  open_email(@debt.user.email)
  expect(current_email).to have_content "Payment confirmed"
end

Then(/^the organiser should receive an email notification$/) do
  ConfirmationMailer.notification(@debt).deliver!
  open_email(@debt.event.organiser.email)
  expect(current_email).to have_content "You have been paid"
end


