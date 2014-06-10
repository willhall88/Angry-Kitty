
# Before do
#   @user = User.create(email: "nico@nicosaueressig.de", password: "12345678", password_confirmation:"12345678")
# end

When(/^I click sign up$/) do
  visit('/')
end

Then(/^I want to see a sign up form$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^be able to submit the form$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I sign in with my credentials$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I want to be forwarded to my dashboard$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I sign in with wrong credentials$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I see 'Wrong credentials'$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^am still on the sign in page$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I click "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I want to be signed out$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^not see the dashboard anymore$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I want to see all my events on my dashboard$/) do
  pending # express the regexp above with the code you wish you had
end
