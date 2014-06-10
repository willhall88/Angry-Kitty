class AddDeadlineAgainToEvents < ActiveRecord::Migration
  def change
    change_column :events, :deadline, :datetime
  end
end
