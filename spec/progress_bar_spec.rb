require 'rails_helper'

describe 'Progress Bar' do

  before do
    # user and user_invitee are the same person, this is just so we can put him as a user and userinvitee for the same event
    user = create(:user, email:"nico@hi.com")
    user_invitee = create(:userinvitee, email:"nico@hi.com")
    @organiser = create(:user, email:"new@email.com")
    @userinvitee = create(:userinvitee, email: 'user@user.com')
    @userinvitee2 = create(:userinvitee, email: 'user2@user.com')
    @userinvitee3 = create(:userinvitee, email: 'user3@user.com')
    @userinvitee4 = create(:userinvitee, email: 'user4@user.com')
    @event = build(:event, organiser: @organiser)
    @event.userinvitees << [@userinvitee, @userinvitee2, @userinvitee3, @userinvitee4, user_invitee]
    @event.users << user
    @event.save

  end

  it 'shows the percentage of users who have paid comparing it to all invitees' do
    @debt = Debt.all
    @debt.first.update(paid: true)
    puts @debt.first.paid
    expect(@event.percentage_of_paid).to eq 20
  end
end