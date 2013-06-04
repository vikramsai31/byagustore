# == Schema Information
#
# Table name: merchant_followers
#
#  merchant_id :integer          not null
#  user_id     :integer          not null
#  status      :string(1)        not null
#  id          :integer          not null, primary key
#

class MerchantFollower < ActiveRecord::Base
  attr_accessible :user_id, :merchant_id,:status
  
  def self.following(merchant_id,user_id)
   @follow= MerchantFollower.where(:merchant_id=>merchant_id, :user_id => user_id).count
  end
end
