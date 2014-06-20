Given(/^I am logged in$/) do
  login_as @organiser
end

When(/^I click the remove user button$/) do
  within(:css, "#user-#{@user2.id}") do
  	find('.dropdown a').click
  	find('a', text: 'Remove user').trigger('click')
  end
end

When(/^I click the remove invitee button$/) do
  within(:css, "#user-#{@userinvitee.id}") do
  	find('.dropdown a').click
  	find('a', text: 'Remove invitee').trigger('click')
  end
end

Then(/^I should not see the participant$/) do
  within(:css, ".table") do
    expect(page).not_to have_content("robin")
  end
end

Then(/^I should not see the invitee$/) do
  within(:css, ".table") do
    expect(page).not_to have_content("Will")
  end
end