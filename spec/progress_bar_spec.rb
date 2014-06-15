require 'rails_helper'

describe 'Progress Bar' do
  before do
    userinvitee = create(:userinvitee)
    @organiser = create(:user)
    @user = create(:user, email: 'user@user.com')
    @user2 = create(:user, email: 'user2@user.com')
    @user3 = create(:user, email: 'user3@user.com')
    @user4 = create(:user, email: 'user4@user.com')
    @event = build(:event, organiser: @organiser)
    @event.userinvitees << userinvitee
    @event.users << [@user, @user2, @user3, @user4]
    @event.save

  end

  it 'shows the percentage of users who have paid' do
    @debt = Debt.all
    @debt.first.update(paid: true)
    puts @debt.first.paid
    expect(@event.percentage_of_paid).to eq 25
  end
end