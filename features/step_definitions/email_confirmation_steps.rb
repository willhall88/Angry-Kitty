Given(/^I have completed payment$/) do
  userinvitee = create(:userinvitee)
  organiser = create(:user)
  user = create(:user, email: 'user@user.com')
  @event = Event.new(title:"Hello", organiser_id: organiser.id, total: 5000, deadline:'2020-12-25 09:41:42 +0100')
  @event.userinvitees << userinvitee
  @event.save
  @debt = create(:debt, user_id: user.id, event_id: @event.id)
end

Then(/^they should receive a receipt by email$/) do
  ConfirmationMailer.receipt(@debt).deliver!
  open_email(@debt.user.email)
  expect(current_email).to have_content "Payment of £50.00 confirmed for Hello."
end

Then(/^the organiser should receive an email notification$/) do
  ConfirmationMailer.notification(@debt).deliver!
  open_email(@debt.event.organiser.email)
  expect(current_email).to have_content "You have been paid"
end


