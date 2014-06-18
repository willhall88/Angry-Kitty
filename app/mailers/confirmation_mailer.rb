class ConfirmationMailer < ActionMailer::Base
  default from: "noreply@angrykitty.co.uk"

  def receipt(debt)
    @user = debt.user
    @event = debt.event
    mail(to: @user.email, subject: 'Purrrr! Kitty thanks you for your payment!')
  end

  def notification(debt)
    @organiser = debt.event.organiser
    @event = debt.event
    mail(to: @organiser.email, subject: 'Purrrr! Kitty has received a payment!')
  end

  def celebration(event)
    @event = event
  	@organiser = @event.organiser
    mail(to: @organiser.email, subject: 'Congratulations, all debts have been collected') if @event.debts.unpaid.none?
  end

end
