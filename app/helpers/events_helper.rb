module EventsHelper
  def tabulator(event, current_user)
    paidusers = event.debts.paid.map {|debt|debt.user}
    unpaidusers = event.debts.unpaid.map {|debt|debt.user}
    invitees = event.userinvitees.reject do |invitee|
      event.users.map do |user|
        user.email
      end.include?(invitee.email)
    end

    if current_user == event.organiser
      table = paidusers + unpaidusers + invitees
      return table
    elsif event.debts.unpaid.find_by(user: current_user)
      table = [current_user] + unpaidusers + paidusers + invitees
      return table.uniq
    else
      table = unpaidusers + paidusers + invitees
    end
  end

  #returns array of invitees that are NOT users for this event
  def invitee_tabulator(event)
    invitees = event.userinvitees.reject do |invitee|
      event.users.map do |user|
        user.email
      end.include?(invitee.email)
    end
  end

  def tweet_handle_or_name(user)
    if user.twitterhandle.blank?
      return user.name
    else
      return user.twitterhandle
    end
  end

end
