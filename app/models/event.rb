class Event < ActiveRecord::Base
  belongs_to :organiser, :class_name => 'User'
  has_many :users, through: :debts
  has_many :debts
  has_and_belongs_to_many :userinvitees
  accepts_nested_attributes_for :userinvitees, allow_destroy: true

  def payment_amount
    self.total / self.userinvitees.count
  end

end
