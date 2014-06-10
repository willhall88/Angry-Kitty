class AddDeadlineToEvents < ActiveRecord::Migration
  def change
    add_column :events, :deadline, :datetime
  end
end
