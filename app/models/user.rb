class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events, through: :debts
  has_many :debts
  after_create :add_user_to_invited_events

  def add_user_to_invited_events
    @invitee = Userinvitee.find_by(email: self.email)
    return true unless @invitee

    @invitee.events.each do |event|
      events << event
    end
  end
  
end
