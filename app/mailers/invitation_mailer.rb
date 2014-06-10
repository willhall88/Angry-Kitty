class InvitationMailer < ActionMailer::Base
  default from: "noreply@angrykitty.co.uk"

  def invite(event_invitee)
  	@event_invitee = event_invitee
    mail(to: @event_invitee.invitee.email, subject: 'You have been invited')
  end
  
end
