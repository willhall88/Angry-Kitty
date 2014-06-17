require 'rails_helper'

RSpec.describe Debt, :type => :model do

  context 'managing debt' do
    before do
      user = create(:user)
      invitee = create(:userinvitee)
      organiser = create(:user, email: 'org@niser.com')
      @event = build(:event, organiser: organiser)
      @event.userinvitees << invitee
      @event.users << user
      @event.save
    end

    it 'a debt can be created with a user and an event' do
      expect(@event.debts.count).to eq 1
    end

    it 'debt will be deleted if event is deleted' do
      expect(Debt.count).to eq 1
      @event.destroy
      expect(Debt.count).to eq 0
    end

  end


end
