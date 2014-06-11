class EventsController < ApplicationController

	before_action :authenticate_user!

	def index
		@organising = Event.where(organiser: current_user)
		@participating = current_user.events
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

	def show
		@event = Event.find(params[:id])
		@users = @event.users
		# @userinvitees = Userinvitee.all
		@userinvitees = @event.userinvitees
	end
end