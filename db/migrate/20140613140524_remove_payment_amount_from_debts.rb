class RemovePaymentAmountFromDebts < ActiveRecord::Migration
  def change
    remove_column :debts, :payment_amount, :integer
  end
end
