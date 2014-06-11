class UserinviteesController < ApplicationController

  def show
    @event = Event.find(params[:event_id])
    @userinvitee = Userinvitee.find(params[:userinvitee_id])
    @user = User.find_by(email: @userinvitee.email)

    if @user.nil?
      session[:event_id] = params[:event_id]
      session[:userinvitee_id] = params[:userinvitee_id]
      redirect_to new_user_session_path
    elsif current_user == @user
      @user.events << @event
      redirect_to "/events/#{@event.id}"
    else
      @user.events << @event
      redirect_to new_user_session_path
    end
  end

end
