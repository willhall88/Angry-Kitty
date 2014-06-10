


# def debt_mailer
#   Debt.all.each do |debt|
#     if send_mail?(debt.deadline,debt.last_harassed)
#       MAIL debt.user
#     end
#   end
# end


def send_mail?(deadline,last_harassed)

  return true if last_harassed == nil 

  maturity = deadline - DateTime.now
  elapsed_time = DateTime.now - last_harassed 

  if user.maturity <= 7 && user.elapsed_time > 1
    true
  elsif user.maturity <= 30 && user.elapsed_time > 3
    true
  elsif user.maturity <= 60 && user.elapsed_time > 7
    true
  elsif user.maturity <= 120 && user.elapsed_time > 14
    true
  elsif user.maturity >= 120 && user.elapsed_time > 30
    true
  else
    false
  end

end


