Given(/^I am an organiser of an event$/) do
  @userinvitee = create(:userinvitee, name: 'Will')
  @organiser = User.create!(email:"nico@tester.com", password:"12345678", password_confirmation:"12345678")
  @user2 = User.create!(email:"robin@test.com", password:"12345678", password_confirmation:"12345678", name: "robin")
  @user3 = User.create!(email:"apo@test.com", password:"12345678", password_confirmation:"12345678")
  @event = Event.new(title:"Stag Party", deadline: DateTime.now + 2, organiser_id: @organiser.id, total:1000)
  @event.users << [@user2, @user3]
  @event.userinvitees << @userinvitee
  @event.save!
end

When(/^all the debts have been paid$/) do
  @event.debts.each do |debt|
    debt.update(paid: true)
  end
end

Then(/^I want to receive an email with the content "(.*?)"$/) do |arg1|
  ConfirmationMailer.celebration(@event).deliver!
  open_email('nico@tester.com')
  expect(current_email).to have_content(arg1)
  open_email('robin@test.com')
  expect(current_email).to eq nil
end
