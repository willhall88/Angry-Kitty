class AddPaymentAmountToDebts < ActiveRecord::Migration
  def change
    add_column :debts, :payment_amount, :integer
  end
end
