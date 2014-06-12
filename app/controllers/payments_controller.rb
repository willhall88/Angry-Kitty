class PaymentsController < ApplicationController

  before_action :authenticate_user!

  def create
  	@event = Event.find(params[:event_id])
  	user = User.find(params[:user_id])
  	debt = user.debts.find_by(event_id: params[:event_id])
  	debt.pay!(current_user)
  rescue ActiveRecord::RecordInvalid
  	flash[:notice] = 'Could not update paid status'
  ensure
	redirect_to event_path(@event)
  end

end