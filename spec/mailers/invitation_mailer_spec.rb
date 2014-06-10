require "rails_helper"

RSpec.describe InvitationMailer, :type => :mailer do


	  let(:invitee) { double :invitee, email: "foo@bar.com", invitee_id: 1 }
	  let(:event) { Event.create }
      let(:event_invitee) { double :event_invitee, event: event, invitee: invitee }
    
    it 'can send an invitation email to an invitee' do
      InvitationMailer.invite(event_invitee).deliver!
      open_email('foo@bar.com')
      expect(current_email).to have_content "RSVP"
    end
  
end
