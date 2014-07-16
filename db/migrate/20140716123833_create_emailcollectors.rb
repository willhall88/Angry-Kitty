class CreateEmailcollectors < ActiveRecord::Migration
  def change
    create_table :emailcollectors do |t|

      t.timestamps
    end
  end
end
