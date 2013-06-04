class TransactionsController < ApplicationController
	def new
	   @order = Order.find(params[:order_id])
		@transaction = Transaction.new(params[:transaction])
		  @category_div = Category.get_category
		   @amount = calculate_amount
	end
	
	def create 
	      @category_div = Category.get_category
	      @order = Order.find(params[:order_id])
	  @transaction = Transaction.new(params[:transaction])
	    if @transaction.save
        render :action=> "success"
      else
       render :action=>"new"
      end
  
	
	 end
	 
	  protected

  def calculate_amount
    @amount = Cart.get_total(session[:cart_id])
    if @amount.nil?
      "0"
    else
      @amount
    end
  end
end
