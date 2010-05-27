class AddEventTypeIdToLogEntries < ActiveRecord::Migration
  def self.up
    add_column :log_entries, :event_type_id, :integer
  end

  def self.down
    remove_column :log_entries, :event_type_id
  end
end
