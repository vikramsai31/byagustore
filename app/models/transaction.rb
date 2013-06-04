# == Schema Information
#
# Table name: transactions
#
#  id              :integer          not null, primary key
#  order_id        :integer
#  action          :string(255)
#  amount          :integer
#  success         :boolean
#  authorization   :string(255)
#  message         :string(255)
#  params          :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  card_type       :string(10)
#  cvv             :integer
#  card_expires_on :date
#

class Transaction < ActiveRecord::Base
  attr_accessible :action, :amount, :authorization, :message, :order_id, :params, :success, 
  :response,:card_type,:cvv,:card_expires_on
  attr_accessor :card_number
  belongs_to :order
  serialize :params
  validates :card_number,:cvv,:card_expires_on, :presence => true
  
  def response=(response)
    self.success       = response.success?
    self.authorization = response.authorization
    self.message       = response.message
    self.params        = response.params
 
  rescue ActiveMerchant::ActiveMerchantError => e
    self.success       = false
    self.authorization = nil
    self.message       = e.message
    self.params        = {}
  end
  
  
end
