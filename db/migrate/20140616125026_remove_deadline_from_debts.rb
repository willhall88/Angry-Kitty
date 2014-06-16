class RemoveDeadlineFromDebts < ActiveRecord::Migration
  def change
    remove_column :debts, :deadline, :integer
  end
end
