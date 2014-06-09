class Event < ActiveRecord::Base
	belongs_to :organiser, :class_name => 'User'
end
