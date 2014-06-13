class Event < ActiveRecord::Base
  
  belongs_to :organiser, :class_name => 'User', :foreign_key => "organiser_id"
  
  has_many :users, through: :debts
  has_many :debts
  
  validates :organiser_id, presence: true
  validates :deadline, presence: true
  validates :total, presence: true

  has_and_belongs_to_many :userinvitees
  accepts_nested_attributes_for :userinvitees, allow_destroy: true, reject_if: :email_blank

  after_create :payment_calculator

  def payment_calculator
    unless self.total == nil
      self.payment_amount = self.total / self.userinvitees.count
      self.save
    end
  end

  def invite!
    self.userinvitees.each do |invitee|
      InvitationMailer.invite(invitee, self).deliver!
    end
  end

  def send_confirmation_emails(debt)
    ConfirmationMailer.celebration(debt.event).deliver! 
    ConfirmationMailer.receipt(debt).deliver!
    ConfirmationMailer.notification(debt).deliver!
  end

  private


  def email_blank(attributes)
    attributes['email'].blank?
  end

end
