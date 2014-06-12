class UserinviteesController < ApplicationController

  def show
    @event = Event.find(params[:event_id])
    @userinvitee = Userinvitee.find(params[:userinvitee_id])
    @user = User.find_by(email: @userinvitee.email)

    if @user.nil?
      session[:event_id] = params[:event_id]
      session[:userinvitee_id] = params[:userinvitee_id]
      redirect_to new_user_registration_path
    else
      sign_in(:user, @user)
      @user.events << @event
      redirect_to @event
    end

  rescue ActiveRecord::RecordInvalid
    flash[:notice] = "already in the event!"
    redirect_to @event
  end

end
