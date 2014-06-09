require "rails_helper"

include Capybara::Email::DSL

RSpec.describe ChasersMailer, :type => :mailer do

  context 'sending mail' do
    let(:user){ create( :user ) }
    
    it 'can send a mail' do
      ChasersMailer.harass(user).deliver!
      open_email('sroop@sunar.com')
      expect(current_email).to have_content "PAY ME!"
    end


  end

end
