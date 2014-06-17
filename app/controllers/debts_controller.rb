class DebtsController < ApplicationController
  def destroy
    @event = Event.find(params[:event_id])
    debt = Debt.find(params[:id])
    debt.destroy
    redirect_to(event_path(@event))
  end
end
