ANGER_CHART = {
  'polite' => [0.33, 1, 3, 7, 14],
  'angry' => [0.2, 0.5, 2, 3.5, 7],
  'really_angry' => [0.05, 0.2, 1, 3.5, 7]
}

def send_harassment
  Debt.unpaid.each do |debt|
    if send_mail?(debt.deadline, debt.last_harassed, debt.event.angerlevel)
      debt.harass! 
      debt.send_sms!
      debt.last_harassed = time_now
      debt.save!
    end
  end
end

def send_mail?(deadline, last_harassed, angerlevel='polite')
  return true unless last_harassed
  days = days_since(last_harassed)
  delay = harassment_delay(days_to(deadline), angerlevel)
  days > delay
end

def harassment_delay(days_remaining, angerlevel='polite')
  case days_remaining
  when 0..3 then ANGER_CHART[angerlevel][0]
  when 4..7 then ANGER_CHART[angerlevel][1]
  when 8..29 then ANGER_CHART[angerlevel][2]
  when 30..59 then ANGER_CHART[angerlevel][3]
  when 60..120 then ANGER_CHART[angerlevel][4]
  else 30
  end
end

def days_to(deadline)
  seconds_to_days(deadline - time_now)
end

def days_since(last_harassed)
  seconds_to_days(time_now - last_harassed)
end
 
def seconds_to_days(time)
  time / 24.0 / 60.0 / 60.0
end

def time_now
  DateTime.now.in_time_zone
end

