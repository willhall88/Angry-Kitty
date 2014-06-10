class CreateJoinTableEventsUserinvitees < ActiveRecord::Migration
  def change
    create_join_table :events, :userinvitees do |t|
      # t.index [:event_id, :userinvitee_id]
      # t.index [:userinvitee_id, :event_id]
    end
  end
end
