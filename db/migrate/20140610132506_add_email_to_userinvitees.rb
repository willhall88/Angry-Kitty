class AddEmailToUserinvitees < ActiveRecord::Migration
  def change
    add_column :userinvitees, :email, :string
  end
end
