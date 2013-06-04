# == Schema Information
#
# Table name: merchants
#
#  id                :integer          not null, primary key
#  merchant_name     :string(50)
#  first_name        :string(25)
#  last_name         :string(25)
#  email             :string(25)
#  address           :string(55)
#  city              :string(25)
#  state             :string(3)
#  primary_phone     :string(14)       not null
#  secondary_phone   :string(14)
#  active            :string(1)        default("N")
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  zip               :integer
#  logo_file_name    :string(25)
#  logo_content_type :string(25)
#  logo_file_size    :integer
#  logo_updated_at   :datetime
#

class Merchant < ActiveRecord::Base
  has_many :products,:dependent => :destroy
  has_attached_file :logo, :styles => { :thumb => "150x150#", 
    :medium => "300x300#", 
    :large => "500x500>" },
  :url  => "/assets/merchants/:id/:style/:basename.:extension",
    :path => ":rails_root/public/assets/merchants/:id/:style/:basename.:extension"
    
    attr_accessible :merchant_name,:first_name,:last_name,:email,:address,:city,:state,:zip,
    :primary_phone,:secondary_phone,:logo
    
validates_attachment_presence :logo
#validates_attachment_size :data, :less_than => 5.megabytes
validates_attachment_content_type :logo, :content_type => ['image/jpeg', 'image/png']

validates :merchant_name,:first_name,:last_name,:email,:address,:city,:state,:zip,:primary_phone,:logo, :presence => true

    


  

 
end
