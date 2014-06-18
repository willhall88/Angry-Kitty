require "rails_helper"

RSpec.describe InvitationMailer, :type => :mailer do

    
    it 'can send an invitation email to an invitee' do
      userinvitee = create(:userinvitee)
      user    = create(:user)
  	  invitee = Userinvitee.create(email: "foo@bar.com") 
  	  event   = Event.new(deadline: DateTime.now + 4, organiser_id: user.id, total: 1000, title:"Hi zomg") 
      event.userinvitees << userinvitee
      event.save
      InvitationMailer.invite(invitee, event).deliver!
      open_email('foo@bar.com')
      expect(current_email).to have_content "RSVP"
    end
  
end
