# == Schema Information
#
# Table name: products
#
#  id               :integer          not null, primary key
#  merchant_id      :integer
#  name             :string(35)
#  brand            :string(35)
#  brand_model_no   :string(35)
#  description      :text
#  heading1         :string(350)
#  heading1_desc    :text
#  heading2         :string(350)
#  heading2_desc    :text
#  dimensions       :string(10)
#  weight           :integer
#  size_available   :string(25)
#  price            :integer
#  color_available  :string(100)
#  model_no         :string(20)
#  created_at       :datetime
#  updated_at       :datetime
#  category_id      :integer          not null
#  featured_product :string(1)        default("N")
#  variant          :string(25)
#  variant_value    :string(25)
#

class Product < ActiveRecord::Base
	has_many :photos,:dependent => :destroy
	has_many :line_items, :through => :product_id
	belongs_to :merchant
	belongs_to  :category
	attr_accessor :quantity
	accepts_nested_attributes_for :photos, :line_items

  attr_accessible  :description, :model_no, :name, :price,:photos_attributes,
  :brand,:brand_model_no,:description,:heading1,:heading1_desc,:dimensions,:weight,:variant,:variant_value,
  :merchant_id,:heading2,:heading2_desc,:category_id,:featured_product
  

  def self.first_pic(product_id)
  	Photo.first.data(:product_id => product_id)
  end
  
  
 
end

