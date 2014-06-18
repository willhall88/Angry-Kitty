Given(/^There is an event with an organiser$/) do
  userinvitee = create(:userinvitee)
  @organiser = User.create(email: 'bar@foo.com', password: '12345678', password_confirmation: '12345678')
  @event = Event.new(organiser_id: @organiser.id, deadline: 3.days.from_now, total:1000, title: 'Hiii zomg')
  @event.userinvitees << userinvitee
  @event.save
  @debt = @event.debts.first
end

Given(/^there is a participant with an email address$/) do
  @user = User.create(email: 'foo@bar.com', password: '12345678', password_confirmation: '12345678')
end

Given(/^there is an unregistered invitee$/) do
  @unreginvitee = Userinvitee.create(email: 'new@newinvitee.com', events: [@event])
end

Given(/^there is a registered invitee$/) do
  @reginvitee = Userinvitee.create(email: 'foo@bar.com', events: [@event])
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
  logout
end

Given(/^the invitee is already a user$/) do
  expect(User.where(email: @reginvitee.email).size).to eq 1
end

When(/^the registered user clicks the link in the invitation email$/) do
  InvitationMailer.invite(@reginvitee, @event).deliver!
  open_email('foo@bar.com')
  current_email.click_link 'Accept'
end

When(/^an unregistered user clicks the link in the invitation email$/) do
  InvitationMailer.invite(@unreginvitee, @event).deliver!
  open_email('new@newinvitee.com')
  current_email.click_link 'Accept'
end

When(/^the existing user will be added to the event$/) do
  expect(@event.users.first.email).to eq @reginvitee.email
end

Then(/^the new user will be added to the event$/) do
  expect(@event.users.first.email).to eq @unreginvitee.email
end

Then(/^they will be re\-directed to the sign up page$/) do
  expect(current_path).to eq '/users/sign_up'
end

Given(/^the invitee is the current user$/) do
  login_as @user
end

Then(/^they will be re\-directed to the event$/) do
  expect(current_path).to eq "/events/#{@event.id}"
end

Then(/^they can fill in their invitee details on the sign up page$/) do
  fill_in 'Full Name', with: "Scott"
  fill_in 'Mobile', with: "07973361616"
  fill_in 'Email', with: "new@newinvitee.com"
  fill_in 'Password', with: "12345678"
  fill_in 'Password confirmation', with: "12345678"
end

Then(/^they press "(.*?)"$/) do |arg1|
  within("#actual-signup") do
    click_on arg1.to_s
  end
end

Given(/^the participant clicks the link in the invitation email$/) do
  open_email('new@newinvitee.com')
  current_email.click_link 'Accept'
end

Then(/^the participant will not be added to the event$/) do
  expect(@event.users.count).to eq(1)
end

Then(/^they will be re\-directed to the sign in page$/) do
  expect(current_path).to eq '/users/signin'
end

Then(/^they will be re\-directed to the event page$/) do
  expect(current_path).to eq("/events/1")
end
