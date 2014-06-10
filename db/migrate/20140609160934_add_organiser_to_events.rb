binclass AddOrganiserToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :organiser, index: true
  end
end
