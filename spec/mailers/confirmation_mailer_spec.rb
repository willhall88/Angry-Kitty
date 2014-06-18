require "rails_helper"

RSpec.describe ConfirmationMailer, :type => :mailer do

  context 'sending mail' do

    before :each do
      userinvitee = create(:userinvitee)
      user = User.create(email: 'foo@bar.com', password: '12345678', password_confirmation: '12345678')
      organiser = User.create(email: 'bar@foo.com', password: '12345678', password_confirmation: '12345678')
      event = Event.new(organiser_id: organiser.id, title: "need a title here", deadline: 3.days.from_now, total:1000)
      event.userinvitees << userinvitee
      event.save
      event.users << user
      @debt = user.debts.first
      @debt.paid = true
      @debt.save
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

    it 'can send a celebration email to the organiser' do
      ConfirmationMailer.celebration(@debt.event).deliver!
      open_email('bar@foo.com')
      expect(current_email).to have_content "Congratulations, all debts have been collected"
    end

    it 'can send all the emails when all payments complete' do
      @debt.event.send_confirmation_emails(@debt)
      open_email('bar@foo.com')
      expect(current_email).to have_content "You have been paid"
    end



  end

end
  
