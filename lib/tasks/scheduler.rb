def select_debtors
  debtors = Debt.all.select {|debt| debt.paid != true }
  debtors.map{|debt| ChasersMailer.harass(debt).deliver! if send_mail?(debt.event.deadline, debt.last_harassed)}
end

def send_mail?(deadline,last_harassed)

  return true if last_harassed == nil 

  maturity = seconds_to_days((deadline - DateTime.now.in_time_zone).to_f)
  elapsed_time = seconds_to_days((DateTime.now.in_time_zone - last_harassed).to_f) 
  
  if maturity <= 3 && elapsed_time > 0.33
    true
  elsif maturity <= 7 && elapsed_time > 1
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

def seconds_to_days(time)
  time / 24 / 60 / 60
end

