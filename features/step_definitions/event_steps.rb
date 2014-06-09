Before do
  christmas_day = Date.new(2014, 12, 25)
  @user = User.create(email: "nico@nicosaueressig.de", password: "12345678", password_confirmation:"12345678")
  @event = Event.create(description: "Amazing Stag Party", title:"Stag Party", deadline: christmas_day, total: 500, organiser: @user.id)
  login_as @user
end

Then(/^I want to set an event title$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I want to be able to add a brief description$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I want to be able to set a payment deadline$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I want to be able to set the anger level$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I want to be able to set a total payment amount$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I want it to be divided automatically by the participants count$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I want to be able to add users to the event right away$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^fill in their mobile number$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^fill in their email$/) do
  pending # express the regexp above with the code you wish you had
end
