class AddTotalPaymentAmountToEvents < ActiveRecord::Migration
  def change
    add_column :events, :total, :integer
  end
end
