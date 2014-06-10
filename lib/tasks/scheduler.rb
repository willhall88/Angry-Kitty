


# def debt_mailer
#   Debt.all.each do |debt|
#     if send_mail?(debt.deadline,debt.last_harassed)
#       MAIL debt.user
#     end
#   end
# end


def send_mail?(deadline,last_harassed)

  return true if last_harassed == nil 

  maturity = (deadline - DateTime.now.in_time_zone).to_f / 86400
  elapsed_time = (DateTime.now.in_time_zone - last_harassed).to_f / 86400 

  if maturity <= 7 && elapsed_time > 1
    true
  elsif maturity <= 30 && elapsed_time > 3
    true
  elsif maturity <= 60 && elapsed_time > 7
    true
  elsif maturity <= 120 && elapsed_time > 14
    true
  elsif maturity >= 120 && elapsed_time > 30
    true
  else
    false
  end

end


