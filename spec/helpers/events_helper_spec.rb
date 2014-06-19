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
      @event.debts.last.update(paid: true)
      accepted_invitee = create(:userinvitee, email: 'unpaid@user.com')
      @invitee = create(:userinvitee, email: 'nonaccepted@invitee.com')
      @event.userinvitees << [@invitee, accepted_invitee]
      @event.save
    end

    it 'will not contain an invitee if a user exists with the same email' do
      expect(tabulator(@event, @unpaid_ppt).count).to eq 3
    end

    specify 'if current user has not paid' do
      expect(tabulator(@event, @unpaid_ppt).first).to eq @unpaid_ppt
      expect(tabulator(@event, @unpaid_ppt).last).to eq @invitee
    end

    specify 'if current user has paid' do
      expect(tabulator(@event, @paid_ppt).first).to eq @unpaid_ppt
      expect(tabulator(@event, @paid_ppt).last).to eq @invitee
    end

   end
  
  context 'twitterhandles' do
    
    specify 'a users name will be returned if no twitter handle exists' do
      user = create(:user, name:'Sroop')
      expect(tweet_handle_or_name(user)).to eq 'Sroop'
    end

      specify 'a users twitter handle will be returned if it exists' do
      user = create(:user, name:'Sroop', twitterhandle:'@sroopsunar')
      expect(tweet_handle_or_name(user)).to eq '@sroopsunar'
    end
  end

 end
