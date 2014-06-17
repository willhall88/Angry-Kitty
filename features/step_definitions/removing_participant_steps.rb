Given(/^I am logged in$/) do
  login_as @organiser
end

When(/^I click 'x'$/) do
  within(:css, "#user-#{@user2.id}") {click_on "x"}
end

When(/^I click the invitees delete button$/) do
  within(:css, "#invitee-#{@userinvitee.id}") {click_on "x"}
end

Then(/^I should not see the participant$/) do
  expect(page).not_to have_content("robin")
end

Then(/^I should not see the invitee$/) do
  expect(page).not_to have_content("Will")
end