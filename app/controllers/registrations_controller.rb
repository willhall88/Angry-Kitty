class RegistrationsController < Devise::RegistrationsController
  def new
      if session.has_key? :userinvitee_id
        @userinvitee = Userinvitee.find(session[:userinvitee_id])
      else
        @userinvitee = Userinvitee.new
      end
    
    super
  end

end