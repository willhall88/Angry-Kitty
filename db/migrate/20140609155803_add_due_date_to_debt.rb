class AddDueDateToDebt < ActiveRecord::Migration
  def change
    add_column :debts, :deadline, :datetime
  end
end
