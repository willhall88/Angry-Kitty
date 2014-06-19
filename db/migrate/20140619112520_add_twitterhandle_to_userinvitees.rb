class AddTwitterhandleToUserinvitees < ActiveRecord::Migration
  def change
    add_column :userinvitees, :twitterhandle, :string
  end
end
