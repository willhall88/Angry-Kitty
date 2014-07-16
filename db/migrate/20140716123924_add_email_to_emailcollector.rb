class AddEmailToEmailcollector < ActiveRecord::Migration
  def change
    add_column :emailcollectors, :string, :email
  end
end
