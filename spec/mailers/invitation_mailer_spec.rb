require "rails_helper"

RSpec.describe InvitationMailer, :type => :mailer do


	  let(:invitee) { Userinvitee.new, email: "foo@bar.com" }
	  let(:event) { Event.create }
      
    
    it 'can send an invitation email to an invitee' do
      InvitationMailer.invite(invitee, event).deliver!
      open_email('foo@bar.com')
      expect(current_email).to have_content "RSVP"
    end
  
end
