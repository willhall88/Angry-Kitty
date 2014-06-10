class Event < ActiveRecord::Base
  belongs_to :organiser, :class_name => 'User'
  has_many :users, through: :debts
  has_many :debts

  accepts_nested_attributes_for :users

  def deadline_time
  	deadline.to_datetime + 12.hours
  end

end
