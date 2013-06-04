class LineItemsController < ApplicationController
  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @line_items }
    end
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
    @line_item = LineItem.find(params[:id])
  
    @category_div = Category.get_category

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @line_item }
    end
  end

  # GET /line_items/new
  # GET /line_items/new.json
  def new
    @line_item = LineItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @line_item }
    end
  end

  # GET /line_items/1/edit
  def edit
    @cart = current_cart
    @line_item = @cart.line_items.find_by_cart_id(params[:id])
  end

  # POST /line_items
  # POST /line_items.json
  def create
    @product = Product.find(params[:product_id])
    @cart = current_cart
    qty = params[:line_item][:quantity].to_i

    #@line_item = @cart.line_items.build(:product_id => @product.id)
    @line_item = @cart.add_product(@product.id, qty)
     #@line_item = LineItem.create!(:cart => current_cart, :product => @product, :quantity => 1, :unit_price => @product.price)
    respond_to do |format|
      if !qty.nil?
      if @line_item.save
        format.html { redirect_to root_path, notice: 'Line item was successfully created.' }
        
      else
        
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
    end
  end

  # PUT /line_items/1
  # PUT /line_items/1.json
  def update
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      if @line_item.update_attributes(params[:line_item])
        format.html { redirect_to cart_path(session[:cart_id]), notice: 'Your cart was successfully updated.' }
        format.json { head :no_content }
      else
        
        format.html { redirect_to cart_path(session[:cart_id]), notice: 'Remove the item and try again '}
        #format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy

    respond_to do |format|
      format.html { redirect_to cart_path(session[:cart_id]) }
      format.json { head :no_content }
    end
  end
end
