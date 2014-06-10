class AddNameToUserinvitees < ActiveRecord::Migration
  def change
    add_column :userinvitees, :name, :string
  end
end
