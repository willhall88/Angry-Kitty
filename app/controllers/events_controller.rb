class EventsController < ApplicationController

	def index
		@events = Event.all
		@users = User.all
		@event = Event.new
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(params[:event].permit(:title, :description, :deadline, :total, :angerlevel))
		@event.organiser = current_user
		@event.save
		redirect_to('/events')
	end
end
