require "rails_helper"
include Capybara::Email::DSL

RSpec.describe ConfirmationMailer, :type => :mailer do

  context 'sending mail' do

    before :each do
      user = User.create(email: 'foo@bar.com', password: '12345678', password_confirmation: '12345678')
      organiser = User.create(email: 'bar@foo.com', password: '12345678', password_confirmation: '12345678')
      event = user.events.create(organiser_id: organiser.id, deadline: 3.days.from_now)
      @debt = user.debts.first
    end
    
    it 'can send a receipt mail to the participant' do

      ConfirmationMailer.receipt(@debt).deliver!
      open_email('foo@bar.com')
      expect(current_email).to have_content "Payment confirmed"
    end

    it 'can send a notification email to the organiser' do
      ConfirmationMailer.notification(@debt).deliver!
      open_email('bar@foo.com')
      expect(current_email).to have_content "You have been paid"
    end


  end

end
  
