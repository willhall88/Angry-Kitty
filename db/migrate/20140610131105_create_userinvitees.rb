class CreateUserinvitees < ActiveRecord::Migration
  def change
    create_table :userinvitees do |t|

      t.timestamps
    end
  end
end
