require "rails_helper"

RSpec.describe InvitationMailer, :type => :mailer do

        let(:user) {create(:user)}
	  let(:invitee) { Userinvitee.create(email: "foo@bar.com") }
	  let(:event) { Event.create!(deadline: DateTime.now + 4, organiser_id: user.id) }
      
    
    it 'can send an invitation email to an invitee' do
      InvitationMailer.invite(invitee, event).deliver!
      open_email('foo@bar.com')
      expect(current_email).to have_content "RSVP"
    end
  
end
