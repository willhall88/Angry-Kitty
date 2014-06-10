class AddDeadlineToDebts < ActiveRecord::Migration
  def change
    rename_column :debts, :due_date, :deadline
  end
end
