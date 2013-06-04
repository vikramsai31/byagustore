class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.json
  before_filter :authenticate_user!
  def index
       @order = Order.find(session[:order_id])
  @cart = current_cart
   @lineitem = @cart.line_items
     @shipping_address = current_user.addresses.find(@order.shipping_address_id)
     @billing_address = current_user.addresses.find(@order.billing_address_id)
  end
  
  def checkout
    order = find_or_create_order
    redirect_to next_form_url(order)
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
       @order = Order.find(session[:order_id])
  @cart = current_cart
   @lineitem = @cart.line_items
     @shipping_address = current_user.addresses.find(@order.shipping_address_id)
     @billing_address = current_user.addresses.find(@order.billing_address_id)
    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
      @category_div = Category.get_category
      @address = current_user.addresses.find(params[:id => :billing_address])
    @order = Order.new
 @amount = calculate_amount
 puts @amount
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(session[:order_id])
  @cart = current_cart
   @lineitem = @cart.line_items
     @shipping_address = current_user.addresses.find(@order.shipping_address_id)
     @billing_address = current_user.addresses.find(@order.billing_address_id)
  end

  # POST /orders
  # POST /orders.json
 

  # PUT /orders/1
  # PUT /orders/1.json
  def update
     @cart = current_cart
      @lineitem = @cart.line_items
    @order = Order.find(session[:order_id])
    
    #@order = @cart.build_order(params[:order])
    @billing_address = @order.billing_address
     @shipping_address =@order.shipping_address
     @order.ip_address = request.remote_ip
    @amount = calculate_amount
    @order.total = @amount
    @order.user_id = current_user.id
    
    
    puts "****#{params[:order]["card_expires_on(2i)"]}/#{params[:order]["card_expires_on(1i)"]}****"
   
 result = Braintree::Transaction.sale(:amount => @amount,
     :credit_card => {
      :number => params[:order]["card_number"],
      :cvv => params[:order]["card_verification"],
      :expiration_month => params[:order]["card_expires_on(2i)"],
      :expiration_year => params[:order]["card_expires_on(1i)"]
   }
  ) 
  
  
#@order.card_expires_on = "#{@order.card_expires_on.month}/#{@order.card_expires_on.year}"
          if result.success?
            transaction = result.transaction
            @order.transaction_status = transaction.status
            @order.order_no = result.transaction.id
           
            #@order.update_attributes(params[:order])
          
                
            render :action => "success"
            
          else
             flash.now[:error] = result.message
             render :action => "edit"
             return
            end
        
  
        
 
  end

  def checkout
    #current or in-progress otherwise cart (unless cart is empty)
    order = find_or_create_order
    #@order = session_cart.add_items_to_checkout(order) # need here because items can also be removed
    redirect_to address_url
  end
  
    protected

  def calculate_amount
    @amount = Cart.get_total(session[:cart_id])
    if @amount.nil?
      "100"
    else
      @amount
    end
  end
  
  def get_date(year,month,day)
    card_expires_on ="#{year}/{month}/{day}"
  end

 
end
