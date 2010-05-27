class CreateLogEntries < ActiveRecord::Migration
  def self.up
    create_table :log_entries do |t|
      t.string :event_type
      t.string :additional_info
      t.datetime :logged_at
      t.string :signed_by
      t.string :referral_type
      t.integer :referral_id
      t.integer :referral_year
      t.integer :import_id

      t.timestamps
    end
  end

  def self.down
    drop_table :log_entries
  end
end
