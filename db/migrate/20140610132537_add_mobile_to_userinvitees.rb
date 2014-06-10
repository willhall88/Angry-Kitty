class AddMobileToUserinvitees < ActiveRecord::Migration
  def change
    add_column :userinvitees, :mobile, :string
  end
end
