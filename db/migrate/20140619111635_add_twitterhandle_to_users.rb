class AddTwitterhandleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :twitterhandle, :string
  end
end
