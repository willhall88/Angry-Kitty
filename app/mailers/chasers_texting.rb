module SMSChaser

  def send_sms!
    account_sid = 'ACa7ed7360f5a78cef143d2c88421751a6'
    auth_token = 'b9b56c483acdf8d39838fbddc24fc595'
    @client = Twilio::REST::Client.new account_sid, auth_token

    message = @client.account.sms.messages.create(:body => "#{sms_body}", :to => "#{self.user.mobile}", :from => "+442891042146")
    "Order confirmation has been sent to your phone!"
  end

  def generate_timestamp
    @timestamp = Time.now
  end

  def sms_body
    @sms_body = "You have not yet paid the #{self.payment_amount} for event #{self.event.title}!"
  end

end