class Event < ActiveRecord::Base
  
  belongs_to :organiser, :class_name => 'User', :foreign_key => "organiser_id"
  
  has_many :users, through: :debts
  has_many :debts
  
  validates :organiser_id, presence: true
  
  #validates that there is a pay due date
  validates :deadline, presence: true

  has_and_belongs_to_many :userinvitees
  accepts_nested_attributes_for :userinvitees, allow_destroy: true

  def payment_amount
    self.total / self.userinvitees.count
  end

end
