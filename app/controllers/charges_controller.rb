class ChargesController < ApplicationController

  def new
  	user = User.find(params[:user_id])
  	@debt = user.debts.find_by(event_id: params[:event_id])
  	@payment_amount = @debt.payment_amount
  end

  def create
    # Amount in pennys
  	user = User.find(params[:user_id])
  	debt = user.debts.find(params[:event_id])
  	@payment_amount = debt.payment_amount

    @email = debt.user.email

    customer = Stripe::Customer.create(
      :email => @email,
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @payment_amount,
      :description => "Angry Kitty customer - #{@email}",
      :currency    => 'gbp'
    )

    debt.update(paid: true)
    send_confirmation_emails(debt)

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to events
  end

end
