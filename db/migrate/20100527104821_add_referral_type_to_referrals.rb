class AddReferralTypeToReferrals < ActiveRecord::Migration
  def self.up
    add_column :referrals, :referral_type, :string
  end

  def self.down
    remove_column :referrals, :referral_type
  end
end
