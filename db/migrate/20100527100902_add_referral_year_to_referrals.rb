class AddReferralYearToReferrals < ActiveRecord::Migration
  def self.up
    add_column :referrals, :referral_year, :integer
  end

  def self.down
    remove_column :referrals, :referral_year
  end
end
