require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ChargesHelper. For example:
#
# describe ChargesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ChargesHelper, :type => :helper do

	before do
		@organiser = create(:user)
		user = create(:userinvitee)
		user1 = create(:userinvitee)
		@event = Event.new(title:"Charges Party", deadline:"", total: 5234, organiser_id: @organiser.id)
		@event.userinvitees << [user, user1]
		@event.save
	end

	it 'converts payment amount to pound' do
		payment_amount = @event.payment_amount
		expect(convert_to_pounds(payment_amount)).to eq "£26.17"
	end
end
