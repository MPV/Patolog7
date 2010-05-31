class AddPositionToEventTypes < ActiveRecord::Migration
  def self.up
    add_column :event_types, :position, :integer
  end

  def self.down
    remove_column :event_types, :position
  end
end
