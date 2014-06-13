class AddPaymentAmountToEvent < ActiveRecord::Migration
  def change
    add_column :events, :payment_amount, :integer
  end
end
