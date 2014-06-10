class EventsController < ApplicationController

	def index
		@events = Event.all
		@users = User.all
		@event = Event.new
		@userinvitees = Userinvitee.all
	end

	def new
		@event = Event.new
		@event.userinvitees.new
	end

	def create
		@event = Event.new(params[:event].permit(:title, :description, :deadline, :total, :angerlevel, userinvitees_attributes: [:name, :mobile, :email, :payment_amount]))
		@event.organiser = current_user
		@event.save
		redirect_to('/events')
	end
end
