class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable, :omniauthable,
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
  
  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.uid + "@twitter.com").first
      if registered_user
        return registered_user
      else

        user = User.create(name:auth.extra.raw_info.name,
                            provider:auth.provider,
                            uid:auth.uid,
                            email:auth.uid+"@twitter.com",
                            password:Devise.friendly_token[0,20],
                          )
      end

    end
  end
end
