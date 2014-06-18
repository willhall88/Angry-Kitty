require 'rails_helper'
require_relative '../../lib/tasks/scheduler'

describe 'Sending SMS' do

    before do
      userinvitee = create(:userinvitee)
      user = User.create(email: 'goo@bar.com', mobile: '+447432865747', password: '12345678', password_confirmation: '12345678')
      organiser = User.create(email: 'bar@goo.com', password: '12345678', password_confirmation: '12345678')
      event = Event.new(organiser_id: organiser.id, deadline: 3.days.from_now, total:1000, title:"Hi zomg")
      event.userinvitees << userinvitee
      event.users << user
      event.save
      @debt = user.debts.first 
    end


    it 'connects to twilio' do
      # send_harassment
      expect(Twilio::REST::Client).to receive(:new).and_call_original
      send_harassment
    end

    it 'returns a confirmation' do
      expect(@debt.send_sms!).to eq "Order confirmation has been sent to your phone!"
    end

end