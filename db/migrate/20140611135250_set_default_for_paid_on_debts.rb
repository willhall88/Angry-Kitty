class SetDefaultForPaidOnDebts < ActiveRecord::Migration
  def change
    change_column_default :debts, :paid, false
  end
end
