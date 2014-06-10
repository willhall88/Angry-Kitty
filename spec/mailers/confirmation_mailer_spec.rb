require "rails_helper"
include Capybara::Email::DSL

RSpec.describe ConfirmationMailer, :type => :mailer do

  context 'sending mail' do
    let(:user){ create(:user) }
    let(:event){ create(:event)}
    let(:debt){ create( :debt, event: event, user: user )  }
    
    it 'can send a receipt mail to the participant' do
      user = User.create(email: 'foo@bar.com', password: '12345678', password_confirmation: '12345678')
      event = user.events.create
      debt = user.debts.first
      ConfirmationMailer.receipt(debt).deliver!
      open_email('foo@bar.com')
      expect(current_email).to have_content "Payment confirmed"
    end

    it 'can send a notification email to the organiser' do
      user = User.create(email: 'foo@bar.com', password: '12345678', password_confirmation: '12345678')
      event = user.events.create
      debt = user.debts.first
      ConfirmationMailer.notification(debt).deliver!
      open_email('foo@bar.com')
      expect(current_email).to have_content "Payment confirmed"
    end


  end

end
  
