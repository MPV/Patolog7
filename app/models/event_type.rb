class EventType < ActiveRecord::Base
  has_many :log_entries
  has_many :referrals, :through => :log_entries
  #acts_as_list 
  
  def amount_referrals_completed_previous_but_not_current_step
    if position.blank?
      return 0
    else
      previous_event_types = EventType.find(:all, :conditions => { :position => position-1 })
      unless previous_event_types.empty?
        prev_ev_ids = Array.new
        previous_event_types.each do |previous_event_type|
          prev_ev_ids << previous_event_type.id
        end
        referrals_completed_previous_step = Referral.find(
          :all, 
          :include => :log_entries,
          :conditions => ["log_entries.event_type_id IN (?)", prev_ev_ids]
        )
        referrals_completed_current_step = Referral.find(
          :all, 
          :include => :log_entries,
          :conditions => ["log_entries.event_type_id = ?", id]
        ) # TODO: Support multiple current steps.
        referrals_completed_previous_but_not_current_step = referrals_completed_previous_step - referrals_completed_current_step
        referrals_completed_previous_but_not_current_step.length.to_i
      end
    end
  end
end
