
def send_mail?(user)
  if user.maturity <= 7
    true
  elsif user.maturity <= 30 && user.last_harassed > 3
    true
  elsif user.maturity <= 60 && user.last_harassed > 7
    true
  elsif user.maturity <= 120 && user.last_harassed > 14
    true
  elsif user.maturity >= 120 && user.last_harassed > 30
    true
  else
    false
  end
end