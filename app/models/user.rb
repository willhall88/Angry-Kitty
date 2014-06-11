class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events, through: :debts
  has_many :debts
  after_create :add_user_to_invited_events

  def add_user_to_invited_events
    Userinvitee.where(email: self.email).each do |invite|
      events << invite.event
    end
  end
  
end
