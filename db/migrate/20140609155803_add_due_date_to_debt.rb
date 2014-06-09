class AddDueDateToDebt < ActiveRecord::Migration
  def change
    add_column :debts, :due_date, :datetime
  end
end
