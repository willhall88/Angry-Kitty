module EventsHelper
  def user_tabulator(event, current_user)
    paidusers = event.debts.paid.map {|debt|debt.user}
    unpaidusers = event.debts.unpaid.map {|debt|debt.user}
    if current_user == event.organiser
      table = paidusers + unpaidusers
      return table
    elsif event.debts.unpaid.find_by(user: current_user)
      table = [current_user] + unpaidusers + paidusers
      return table.uniq
    else
      table = unpaidusers +paidusers
    end
  end

  def invitee_tabulator(event)
    invitees = event.userinvitees.reject do |invitee|
      event.users.map do |user|
        user.email
      end.include?(invitee.email)
    end
  end
  
end
