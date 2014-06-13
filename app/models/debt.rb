require_dependency Rails.root.join('app/mailers/chasers_texting.rb')

class Debt < ActiveRecord::Base

  belongs_to :user
  belongs_to :event
  scope :unpaid, -> { where(paid: false) }
  scope :paid, -> { where(paid: true) }
  validates_uniqueness_of :user_id, scope: :event_id

  include SMSChaser

  def harass!
    ChasersMailer.harass(self).deliver!
  end

  def deadline
    event.deadline
  end

  def pay!(authorising_user)
    raise ActiveRecord::RecordInvalid.new('Unauthorised') unless authorising_user == event.organiser
    update(paid: true)
  end

end
