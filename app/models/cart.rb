# == Schema Information
#
# Table name: carts
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  purchased_at :datetime
#

class Cart < ActiveRecord::Base
   attr_accessible :purchased_at
  has_many :line_items, dependent: :destroy
  has_one :order

  def add_product(product_id,qty=1)
  	current_item = line_items.find_by_product_id(product_id)
    	if current_item 
  		current_item.quantity += qty
  	else
  		current_item = line_items.build(product_id: product_id, quantity: qty)
  	end
  
	current_item  	
  end

 def self.get_total(current_cart)
  @cart = Cart.find(current_cart)
  @lineitem = @cart.line_items
    @total = 0
    for item in @lineitem
      @price = item.product.price * item.quantity
      @total = @total + @price
    end
    @total
  end
  
  def total_price
    line_items.to_a.sum(&:full_price)
  end

end
