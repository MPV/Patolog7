class LogEntry < ActiveRecord::Base
  belongs_to :import
  belongs_to :event_type
  belongs_to :referral
end
