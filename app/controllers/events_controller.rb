class EventsController < ApplicationController

	before_action :authenticate_user!	

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
		# raise params.inspect
		@event = Event.new(params[:event].permit(:title, :description, :deadline, :total, :angerlevel, userinvitees_attributes: [:name, :mobile, :email]))
		@event.organiser = current_user
		@event.save
		redirect_to('/events')
	end
end
