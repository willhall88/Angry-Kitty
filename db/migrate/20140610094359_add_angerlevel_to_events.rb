class AddAngerlevelToEvents < ActiveRecord::Migration
  def change
    add_column :events, :angerlevel, :integer
  end
end
