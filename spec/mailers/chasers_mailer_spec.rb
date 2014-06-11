require "rails_helper"

include Capybara::Email::DSL

RSpec.describe ChasersMailer, :type => :mailer do

  context 'sending mail' do
    
    it 'can send a mail' do
      user = User.create(email: 'foo@bar.com', password: '12345678', password_confirmation: '12345678')
      event = user.events.create
      debt = user.debts.first
      ChasersMailer.harass(debt).deliver!
      open_email('foo@bar.com')
      expect(current_email).to have_content "PAY ME!"
    end

  end

end
