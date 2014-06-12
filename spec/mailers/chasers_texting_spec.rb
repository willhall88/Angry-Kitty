require 'rails_helper'

describe 'Sending SMS' do

    before do
      @user = User.create(email: 'foo@bar.com', mobile: '07946185416', password: '12345678', password_confirmation: '12345678')
      @organiser = User.create(email: 'bar@foo.com', password: '12345678', password_confirmation: '12345678')
      @event = user.events.create(organiser_id: organiser.id, deadline: 3.days.from_now)
      @event.users << @user
      @debt = user.debts.first 
      # @debt.stub(:send_sms!).and_return("Order confirmation has been sent to your phone!")
    end


    it 'if email sent' do
      send_harassment
      # expect(@debt.send_sms!).to eq "Order confirmation has been sent to your phone!"
    end

  # end

end