class EventType < ActiveRecord::Base
  has_many :log_entries
end
