class EventsController < ApplicationController

	def index
		if session[:event_id] && user_signed_in?
			redirect_to event_path(session[:event_id])
			session[:event_id] = nil
		end
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
		@event = Event.new(params[:event].permit(:title, :description, :deadline, :total, :angerlevel, userinvitees_attributes: [:name, :mobile, :email]))
		@event.organiser = current_user
		@event.save
		redirect_to('/events')
		@event.userinvitees.each do |invitee|
			InvitationMailer.invite(invitee).deliver!
		end
	end

	def show
		@event = Event.find(params[:id])
	end
end
