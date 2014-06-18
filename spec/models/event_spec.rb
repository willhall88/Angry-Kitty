require 'rails_helper'

RSpec.describe Event, :type => :model do
  
  it 'the per person amount is calculated and entered to the model when event is created' do
    user1 = create(:user, email:'1@1.com')
    userinvitee1 = create(:userinvitee)
    userinvitee2 = create(:userinvitee)
    event = Event.new(organiser: user1, deadline: DateTime.now + 4, total: 1000, title:"Hi zomg")
    event.userinvitees << [userinvitee1, userinvitee2]
    event.save
    expect(event.userinvitees.count).to eq 2
    expect(event.payment_amount).to eq 500


  end

end
