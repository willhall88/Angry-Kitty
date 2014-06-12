class Debt < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  scope :unpaid, -> { where(paid: false) }
  scope :paid, -> { where(paid: true) }

  validates_uniqueness_of :user_id, scope: :event_id

  def harass!
    ChasersMailer.harass(self).deliver!
  end

  def deadline
    event.deadline
  end

end
