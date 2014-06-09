Given(/^there is an event with a due date and participants$/) do
  event = create(:event)
  user = create(:user)
  debt = create(:debt, user_id: user.id, event_id: event.id)
end

Then(/^the participant will receive all emails as per schedule$/) do
  
end

Then(/^they will be removed from the mailing list$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^a celebratory email is sent to the organiser$/) do
  pending # express the regexp above with the code you wish you had
end
