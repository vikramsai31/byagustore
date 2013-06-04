# == Schema Information
#
# Table name: addresses
#
#  id               :integer          not null, primary key
#  first_name       :string(30)
#  last_name        :string(30)
#  addressable_type :string(5)
#  addressable_id   :integer
#  address1         :string(255)
#  address2         :string(255)
#  city             :string(255)
#  state            :string(25)
#  zip              :string(10)
#  phone            :string(12)
#  adefault         :string(10)
#  billing_default  :string(10)
#  active           :string(3)
#  created_at       :datetime
#  updated_at       :datetime
#  user_id          :integer
#  name             :string(20)
#

class Address < ActiveRecord::Base
  attr_accessible :name,:first_name,:last_name,:address1,:address2,:city,:state,:zip,:phone,:billing_default,:user_id,:billing_address,
  :shipping_address
  belongs_to :user
  has_many :billing_address, :class_name => "Order", 
    :foreign_key => "billing_address_id" 
  has_many :shipping_address, :class_name => "Order", 
    :foreign_key => "shipping_address_id"
  
  validates :first_name, :presence => true, :length => { :maximum => 25 }
  validates :last_name, :presence => true, :length => { :maximum => 25 }
  validates :address1, :presence => true, :length => { :maximum => 255 }
  validates :city, :presence => true, :length => { :maximum => 75 }
  validates :state, :presence => true,:length => { :maximum => 75 }
  
  #validates :state_name, :presence => true, :if => Proc.new { |address| address.state_id.blank? }
  validates :zip, :presence => true, :length => { :minimum => 5, :maximum => 12 }
  #before_validation :sanitize_data
  
  def full_name
    [first_name,last_name ].compact.join(' ')
  end
  
  def city_state_zip
    [city,state,zip].join(' ')
  end
  
  def address_lines(join_chars = ', ')
    address_lines_array.join(join_chars)
  end
  
  def address_lines_array
    [address1,address2].delete_if{|add| add.blank?}
  end
end

