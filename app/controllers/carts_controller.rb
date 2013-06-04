class CartsController < ApplicationController
 
  # GET /carts/1
  # GET /carts/1.json
  def show
    @cart = current_cart
    @lineitem = @cart.line_items
     @category_div = Category.get_category
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cart }
    end
  end

  
  def create
    @cart = Cart.new(params[:cart])

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render json: @cart, status: :created, location: @cart }
      else
        format.html { render action: "new" }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy

    respond_to do |format|
      format.html { redirect_to carts_url }
      format.json { head :no_content }
    end
  end
end
