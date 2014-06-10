class Userinvitee < ActiveRecord::Base
	has_and_belongs_to_many :events

	def payment_amount_for(event)
		event.total / event.userinvitees.count
	end
end