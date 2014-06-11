Given(/^There is an event$/) do
  @user = User.create(email: 'foo@bar.com', password: '12345678', password_confirmation: '12345678')
  organiser = User.create(email: 'bar@foo.com', password: '12345678', password_confirmation: '12345678')
  @event = Event.create!(organiser_id: organiser.id, deadline: 3.days.from_now)
  @reginvitee = Userinvitee.create(email: 'foo@bar.com')
  @unreginvitee = Userinvitee.create(email: 'new@newinvitee.com')
  @debt = @user.debts.first
end

Given(/^the event has a title and a description$/) do
  @title = @event.title 
end

Given(/^there is a participant with an email address$/) do
  useremail = @user.email
end

Then(/^an email containing a link will be sent to the participant$/) do
  InvitationMailer.invite(@reginvitee, @event).deliver!
  InvitationMailer.invite(@unreginvitee, @event).deliver!
  open_email('foo@bar.com')
  expect(current_email).to have_link 'Accept'
  expect(current_email).to have_content 'RSVP'
  open_email('new@newinvitee.com')
  expect(current_email).to have_link 'Accept'
  expect(current_email).to have_content 'RSVP'
end

Given(/^there is no current user$/) do
  current_user = nil
end

Given(/^the invitee is already a user$/) do
  @reginvitee.email == @user.email
end

When(/^they click the link in the invitation email$/) do
 InvitationMailer.invite(@reginvitee, @event).deliver!
 open_email('foo@bar.com')
 current_email.click_link 'Accept'
end

When(/^they will be added to the event$/) do
  expect(@event.users.find_by(email: @reginvitee.email)).to eq @user
end

Then(/^they will be re\-directed to the sign in page$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the invitee is the current user$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^they will be re\-directed to the event$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the invitee not a current user$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^they will be re\-directed to the sign up page$/) do
  pending # express the regexp above with the code you wish you had
end