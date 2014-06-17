require "rails_helper"


RSpec.describe ChasersMailer, :type => :mailer do

  context 'sending mail' do
    
    it 'can send a mail' do
      userinvitee = create(:userinvitee)
      organiser = create(:user)
      user = create(:user, email: 'user@user.com')
      event = build(:event, organiser: organiser, total: 1000)
      event.userinvitees << userinvitee
      event.save
      debt = create(:debt, user_id: user.id, event_id: event.id)
      ChasersMailer.harass(debt).deliver!
      open_email(user.email)
      expect(current_email).to have_content "PAY NOW"
      expect(current_email).to have_content "You owe money for #{debt.event.title}"
    end

  end

end
