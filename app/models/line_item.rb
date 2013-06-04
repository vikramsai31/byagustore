# == Schema Information
#
# Table name: line_items
#
#  id            :integer          not null, primary key
#  product_id    :integer          not null
#  cart_id       :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  quantity      :integer          default(1)
#  variant       :string(10)
#  variant_value :string(10)
#  price         :integer
#

class LineItem < ActiveRecord::Base
  belongs_to :product 
  belongs_to :cart
 QUANTITIES = [1,2,3,4,5]
  before_save :inactivate_zero_quantity
  attr_accessible :cart_id, :product_id, :quantity


  def self.get_count(current_cart)
  	if current_cart.nil?
  		current_count = 0
  	else
  	current_count = where(:cart_id => current_cart).count
  	#current_count = current_cart
  	end
  	current_count
  end

  def self.get_price(line_item_id, price)
    item = LineItem.find(line_item_id)
    
    item.quantity * price 
       
  end  
  


  
    def inactivate_zero_quantity
      if quantity <= 0
        return false
       end
    end
  
end
