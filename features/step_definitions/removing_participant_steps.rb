Given(/^I am logged in$/) do
  login_as @organiser
end

When(/^I click 'x'$/) do
  within(:css, "#user-#{@user2.id}") {click_on "x"}
end

Then(/^I should not see the participant$/) do
  expect(page).not_to have_content("robin")
end