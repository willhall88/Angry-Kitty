Given(/^I have an event$/) do

  userinvitee = create(:userinvitee)
  @event = Event.new(total:1000, title:"Hi zomg! ! !")
  @event.deadline = DateTime.now + 4
  @event.organiser_id = @nico.id
  @event.userinvitees << userinvitee
  @event.save!
end

And(/^I have one paid user$/) do
  @user = create(:user, email: 'user@user.com')
  @debt = create(:debt, user_id: @user.id, event_id: @event.id, paid: true)
end

Given(/^I have one unpaid user$/) do
  @user2 = create(:user)
  @debt2 = create(:debt, user_id: @user2.id, event_id: @event.id, paid: false)
end

Then(/^I should see a list of paid and a list of unpaid participants$/) do
  expect(page).to have_content "Mark as paid"
end

Given(/^I am an organiser$/) do
  login_as @nico
end

When(/^I click on 'Paid' button next to that unpaid participant$/) do
  expect(current_path).to eq event_path(@event)
  click_on('Mark as paid')
end

Then(/^I should see the user has paid$/) do
  expect(page).to have_content "Paid"
end

Given(/^I am a participant$/) do
  @participant = create(:user, email: 'participant@user.com')
  login_as @participant
end

Then(/^I should not see the 'Paid' button$/) do
  # expect(page).to have_content('✗')
  expect(page).not_to have_link('Mark as paid')
end

Given(/^I am the unpaid user$/) do
  @debt3 = create(:debt, user_id: @participant.id, event_id: @event.id, paid: false)
end

Then(/^I should see the button 'Pay with Card'$/) do
  expect(page).to have_button('Pay with Card')
end

Given(/^I am a paid user$/) do
  @debt3 = create(:debt, user_id: @participant.id, event_id: @event.id, paid: true)
end

Then(/^I should not see the button 'PAY NOW'$/) do
  expect(page).not_to have_content('PAY NOW')
end

