class EventType < ActiveRecord::Base
  has_many :log_entries
  has_many :referrals, :through => :log_entries
  #acts_as_list 
end
