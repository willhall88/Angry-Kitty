class EventsController < ApplicationController

	before_action :authenticate_user!

	def index
		#where returns an array (needed for the each iterator in view)
		@organising = Event.where(organiser: current_user)
		#need to check below does not include organisers (might need to be current_user.debts)
		@participating = current_user.events
	end

	def new
		@event = Event.new
		@event.userinvitees.new
	end

	def create
		@event = Event.new(params[:event].permit(:title, :description, :deadline, :total, :angerlevel, userinvitees_attributes: [:name, :mobile, :email]))
		@event.organiser = current_user
		@event.save
		redirect_to('/events')
	end

	def show
		@event = Event.find(params[:id])
		#below is empty until userinvitees have confirmed participation
		#@event.users does not work, we need to querey the debt table directly
		@paid = Debt.where(event: @event).where(paid: true)
		@unpaid = Debt.where(event: @event).where(paid: nil)
	end
end