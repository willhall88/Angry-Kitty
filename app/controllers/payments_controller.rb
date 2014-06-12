class PaymentsController < ApplicationController

  before_action :authenticate_user!

  def create
  	@event = Event.find(params[:event_id])
  	user = User.find(params[:user_id])
  	debt = user.debts.find_by(event_id: params[:event_id])
    debt.paid = true
    debt.save! if @event.organiser == current_user
 #  rescue
 #    flash[:notice] = "cant do that"
 #  ensure
	redirect_to event_path(@event)
  end

end
