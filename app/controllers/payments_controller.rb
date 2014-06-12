class PaymentsController < ApplicationController

  before_action :authenticate_user!

  def create
    user = User.find(params[:user_id])
    debt = user.debts.find_by(event_id: params[:event_id])
    debt.paid = true
    debt.save
    @event = Event.find(params[:event_id])
    redirect_to event_path(@event)
  end
end
