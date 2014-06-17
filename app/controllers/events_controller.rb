class EventsController < ApplicationController

	before_action :authenticate_user!

	def index
		if session[:event_id] && user_signed_in?
			redirect_to event_path(session[:event_id])
			session[:event_id] = nil
		end
		@organising = Event.where(organiser: current_user)
		@participating = current_user.events
	end

	def new
		@event = Event.new
		@event.userinvitees.new
		render :layout => false
	end

	def create
		@event = Event.new(params[:event].permit(:title, :description, :deadline, :total, :angerlevel, userinvitees_attributes: [:name, :mobile, :email]))
		@event.organiser = current_user
		@event.save!
		@event.invite!
		redirect_to('/events')
	# rescue
	# 	# flash[:notice] = 'Cannot submit an empty field'
	# 	render 'new'
	end

	def show
		@event = Event.find(params[:id])
		#below is empty until userinvitees have confirmed participation
		@paid = Debt.where(event: @event).where(paid: true)
		@unpaid = Debt.where(event: @event).where(paid: false)
		@user = current_user
		@payment_amount = @event.payment_amount
	end
end
