class AddAngerlevelAgainToEvents < ActiveRecord::Migration
  def change
    change_column :events, :angerlevel, :string
  end
end
