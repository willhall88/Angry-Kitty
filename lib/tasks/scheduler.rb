


# def debt_mailer
#   Debt.all.each do |debt|
#     if send_mail?(debt.deadline,debt.last_harassed)
#       MAIL debt.user
#     end
#   end
# end


def send_mail?(deadline,last_harassed)

  # return true if last_harassed == nil 

  # true
  # puts deadline.class
  puts last_harassed
  # puts last_harassed.class
  # puts DateTime.now.class
  # puts DateTime.now

  maturity = (deadline - DateTime.now.in_time_zone).to_f
  # puts maturity
  elapsed_time = (DateTime.now.in_time_zone - last_harassed).to_f 

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


