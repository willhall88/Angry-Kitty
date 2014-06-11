MATURITY_HASH = {
  3 => 0.33,
  7 => 1,
  30 => 3,
  60 => 7,
  120 => 14,
  121 => 30
}

def select_debtors
  debtors = Debt.all.select {|debt| debt.paid != true }
  debtors.map{|debt| ChasersMailer.harass(debt).deliver! if send_mail?(debt.event.deadline, debt.last_harassed)}
end

def send_mail?(deadline,last_harassed)

  return true if last_harassed == nil 

  maturity = seconds_to_days(deadline - time_now)
  elapsed_time = seconds_to_days(time_now - last_harassed) 

  return true if maturity > MATURITY_HASH.keys.last && elapsed_time > MATURITY_HASH.values.last

  MATURITY_HASH.each do |key, value|
    return true if (maturity <= key && elapsed_time > value)  
  end

  return false
end
 
def seconds_to_days(time)
  time / 24 / 60 / 60
end

def time_now
  DateTime.now.in_time_zone
end
