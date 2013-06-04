class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :minicart
   helper_method :current_cart, :session_order

def minicart
  if !current_cart.nil?
     @cart = current_cart
    @lineitem = @cart.line_items
  end
end

private
 def current_cart
     if session[:cart_id]
  	@current_cart ||= Cart.find(session[:cart_id])
    session[:cart_id] = nil if @current_cart.purchased_at
    end
    
    if session[:cart_id].nil?
  	@current_cart = Cart.create!
  	session[:cart_id] = @current_cart.id
  	end
  	@current_cart
  end
  
  def session_order
    find_or_create_order
  end
  
  def find_or_create_order
    
    if session[:order_id].nil?
       create_order
     else
       @session_order =Order.find(session[:order_id])
     end
     @session_order
  end
  
  def create_order
     order = Order.new
    @session_order = Order.create!(:order_no => Time.now.to_i,:ip_address => request.env['REMOTE_ADDR'],
     :billing_address_id => @address.id,:cart_id=> current_cart ,:user_id=>current_user.id) 
                                               
    session[:order_id] =  @session_order.id
  end
  
    def cc_params
      {
          :brand => params[:card_type],
          :number => params[:card_number],
          :verification_value => params[:card_verification],
          :month => params[:month],
          :year => params[:year],
          :first_name => params[:first_name],
          :last_name => params[:last_name]
        }
  end
  #filter_parameter_logging :card_number, :card_verification
end
