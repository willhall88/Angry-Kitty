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

  maturity = seconds_to_days((deadline - DateTime.now.in_time_zone).to_f)
  elapsed_time = seconds_to_days((DateTime.now.in_time_zone - last_harassed).to_f) 

  return true if maturity > MATURITY_HASH.keys.last && elapsed_time > MATURITY_HASH[121]

  MATURITY_HASH.each do |key, value|
    return true if (maturity <= key && elapsed_time > value)  
  end

  return false
end
 
def seconds_to_days(time)
  time / 24 / 60 / 60
end

