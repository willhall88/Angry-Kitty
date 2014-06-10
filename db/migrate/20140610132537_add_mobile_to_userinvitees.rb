class AddMobileToUserinvitees < ActiveRecord::Migration
  def change
    add_column :userinvitees, :mobile, :integer
  end
end
