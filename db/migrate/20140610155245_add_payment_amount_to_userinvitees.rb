class AddPaymentAmountToUserinvitees < ActiveRecord::Migration
  def change
    add_column :userinvitees, :payment_amount, :integer
  end
end
