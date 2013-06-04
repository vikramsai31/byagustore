# == Schema Information
#
# Table name: orders
#
#  id                  :integer          not null, primary key
#  cart_id             :integer
#  order_no            :string(255)
#  transaction_status  :string(255)      default("F")
#  total               :integer
#  shipping_fee        :integer          default(0)
#  sales_tax           :integer          default(0)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  ip_address          :string(25)
#  card_type           :string(10)
#  card_expires_on     :date
#  card_verification   :integer
#  user_id             :integer
#  shipping_address_id :integer
#  billing_address_id  :integer
#

class Order < ActiveRecord::Base
  attr_accessible :cart_id, :order_no, :sales_tax, :shipping_fee, :total,
  :transaction_status,:ip_address,:card_type,:card_verification,:card_number,:billing_address_id,:shipping_address_id,
  :first_name,:last_name,:card_expires_on,:user_id
  
# attr_accessor :billing_address_id,:shipping_address_id
belongs_to :cart
belongs_to :user
belongs_to :billing_address, :class_name => "Address"
  belongs_to :shipping_address, :class_name => "Address"
attr_accessor :card_number,:first_name,:last_name
has_many :transactions, :through => :order_id
has_many :invoices
 #validate :validate_card, :on => :update
 #validates :card_number,:card_verification,:card_expires_on, :presence => true
 
  
  def update_cart
    cart.update_attribute(:purchased_at, Time.now) 
  end
 
 def do_purchase(amount)
     result = Braintree::Transaction.sale(:amount => "1000",
     :credit_card => {
      :number => card_number,
      :cvv => card_verification,
      :expiration_month => '11',
      :expiration_year => '2013'
    },
    :options => {
      :submit_for_settlement => true
    }
  )
  
  result.success?
  end
  def current_cart
    current_cart = session[:cart_id]
  end
  
def total_price
  total_price = Cart.get_total(Cart.get_total(session[:cart_id]))
  total_price
  end
private
  def purchase_options
    {
      :ip => ip_address,
      :billing_address => {
        :name     => "#{billing_first_name} #{billing_last_name}",
        :address1 => billing_address1,
        :city     => billing_city,
        :state    => billing_state,
        :country  => "US",
        :zip      => billing_zip
      }
    }
  end

 def validate_card
    unless credit_card.valid?
      credit_card.errors.full_messages.each do |message|
        errors.add(:base,message)
        end
    end
  end
  
  

  
end
