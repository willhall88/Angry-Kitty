class ChasersMailer < ActionMailer::Base
  default from: "noreply@angrykitty.co.uk"

  def harass(debt)
    @debt = debt
    @user = debt.user
    @event = debt.event
    mail(to: @user.email, subject: 'Pay the kitty')
  end

end
