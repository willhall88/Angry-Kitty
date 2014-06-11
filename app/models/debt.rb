class Debt < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  scope :unpaid, -> { where(paid: false) }
  scope :paid, -> { where(paid: true) }

  def harass!
    ChasersMailer.harass(self).deliver!
  end

  def deadline
    event.deadline
  end

end
