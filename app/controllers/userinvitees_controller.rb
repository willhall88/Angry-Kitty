class UserinviteesController < ApplicationController

	def new
		@userinvitee = Userinvitee.new
	end

	def create
		@userinvitee = Userinvitee.new(params[:userinvitee].permit(:email, :mobile, :name))
		@userinvitee.save!
		redirect_to('/events')
	end
end
