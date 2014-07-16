class AddEmailToEmailcollector < ActiveRecord::Migration
  def change
    add_column :emailcollectors, :email, :string
  end
end
