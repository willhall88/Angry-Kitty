class AddLastHarassedToDebts < ActiveRecord::Migration
  def change
    add_column :debts, :last_harassed, :datetime
  end
end
