class CreateSignatures < ActiveRecord::Migration
  def self.up
    create_table :signatures do |t|
      t.integer :log_entry_id
      t.integer :person_id

      t.timestamps
    end
  end

  def self.down
    drop_table :signatures
  end
end
