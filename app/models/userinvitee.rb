class Userinvitee < ActiveRecord::Base
	has_and_belongs_to_many :events
	validate :email, presence: true

end