class Referral < ActiveRecord::Base
  has_many :log_entries, :order => 'logged_at ASC'
end
