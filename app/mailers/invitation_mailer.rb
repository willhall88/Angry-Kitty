class InvitationMailer < ActionMailer::Base
  default from: "noreply@angrykitty.co.uk"

  def invite(userinvitee, event)
  	@userinvitee = userinvitee
  	@event = event
    mail(to: @userinvitee.email, subject: 'You have been invited')
  end
  
end
