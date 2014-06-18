require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the EventsHelper. For example:
#
# describe EventsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe EventsHelper, :type => :helper do
 context 'the event users table' do

  before do
    @organiser = create(:user, email: 'org@niser.com')
    @event = build(:event, organiser: @organiser)
    @unpaid_ppt = create(:user, email: 'unpaid@user.com')
    paid_ppt = create(:user, email: 'paid@user.com')
    @event.users << [@unpaid_ppt, paid_ppt]
    @event.save
    @event.debts.last.update(paid: true)
  end

  it 'will not contain an invitee if a user exists with the same email' do
    accepted_invitee = create(:userinvitee, email: 'unpaid@user.com')
    @invitee = create(:userinvitee, email: 'nonaccepted@invitee.com')
    @event.userinvitees << [@invitee, accepted_invitee]
    expect(invitee_tabulator(@event).count).to eq 1
  end

  specify 'if current user has not paid' do
    expect(user_tabulator(@event, @unpaid_ppt).first).to eq @unpaid_ppt
    expect(invitee_tabulator(@event).last).to eq @invitee
  end

  specify 'if current user has paid' do
    expect(user_tabulator(@event, @paid_ppt).first).to eq @unpaid_ppt
    expect(invitee_tabulator(@event).last).to eq @invitee
  end

  specify 'organiser is not displayed' do
    expect(user_tabulator(@event, @organiser).select{|element| element == @organiser}.count).to eq 0
  end

 end
end
