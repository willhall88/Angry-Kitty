def harassment_delay(days_remaining)
  case days_remaining
  when 0..3 then 0.33
  when 4..7 then 1
  when 8..29 then 3
  when 30..59 then 7
  when 60..120 then 14
  else 30
  end
end

def send_harassment
  Debt.unpaid.each do |debt|
    debt.harass! if send_mail?(debt.deadline, debt.last_harassed)
  end
end

def send_mail?(deadline, last_harassed)
  return true unless last_harassed
  days_since(last_harassed) > harassment_delay(days_to(deadline))
end

def days_to(deadline)
  seconds_to_days(deadline - time_now)
end

def days_since(last_harassed)
  seconds_to_days(time_now - last_harassed)
end
 
def seconds_to_days(time)
  time / 24 / 60 / 60
end

def time_now
  DateTime.now.in_time_zone
end

