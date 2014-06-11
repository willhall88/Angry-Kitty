require "rails_helper"

include Capybara::Email::DSL

RSpec.describe ChasersMailer, :type => :mailer do

  context 'sending mail' do
    
    it 'can send a mail' do
      organiser = create(:user)
      user = create(:user, email: 'user@user.com')
      event = create(:event, organiser: organiser)
      debt = create(:debt, user_id: user.id, event_id: event.id)
      ChasersMailer.harass(debt).deliver!
      open_email(user.email)
      expect(current_email).to have_content "PAY ME!"
      expect(current_email).to have_content "You owe money for #{debt.event}"
    end


  end

end
