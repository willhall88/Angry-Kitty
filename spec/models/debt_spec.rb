require 'rails_helper'

RSpec.describe Debt, :type => :model do

  context 'creating debt' do
      let(:user) {User.new}
      let(:event) {Event.new}
      let(:debt) {Debt.new(user_id: user.id, event_id: event.id)}

    it 'a debt can be created with a user and an event' do
      debt.save
    end

  end


end
