module SMSChaser

  def send_sms!
    account_sid = Rails.application.secrets.twilio_account_sid
    auth_token = Rails.application.secrets.twilio_auth_token
    @client = Twilio::REST::Client.new account_sid, auth_token

    message = @client.account.sms.messages.create(:body => "#{sms_body}", :to => "#{self.user.mobile}", :from => Rails.application.secrets.twilio_from_number)
    "Order confirmation has been sent to your phone!"
  end

  def generate_timestamp
    @timestamp = Time.now
  end

  def sms_body
    @sms_body = "You have not yet paid the #{self.payment_amount} for event #{self.event.title}!"
  end

end