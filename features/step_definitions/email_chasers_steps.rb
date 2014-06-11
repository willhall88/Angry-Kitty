Given(/^there is an event with a due date and participants$/) do
  organiser = create(:user)
  user = create(:user, email: 'user@user.com')
  event = create(:event, organiser: organiser)
  @debt = create(:debt, user_id: user.id, event_id: event.id)
end

Then(/^the participant will receive all emails as per schedule$/) do
  ChasersMailer.harass(@debt).deliver!
  open_email(@debt.user.email)
  expect(current_email).to have_content "PAY ME!"
end



Then(/^a celebratory email is sent to the organiser$/) do
  pending # express the regexp above with the code you wish you had
end
