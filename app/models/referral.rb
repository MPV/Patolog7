class Referral < ActiveRecord::Base
  has_many :log_entries, :order => 'logged_at ASC'

  def days_from_first_to_last_log_entry
    (last_log_entry.logged_at.to_date - first_log_entry.logged_at.to_date).to_i
  end
  
  def first_log_entry
    LogEntry.find(:first, :conditions => { :referral_id => id }, :order => "logged_at ASC")
  end
  
  def last_log_entry
    LogEntry.find(:first, :conditions => { :referral_id => id }, :order => "logged_at DESC")
  end

end
