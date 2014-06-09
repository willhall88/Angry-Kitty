class Event < ActiveRecord::Base
  has_many :users, through: :debts
  has_many :debts
end
