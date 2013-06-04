class MerchantsController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:new,:show, :index]
  def new
  
    @merchant = Merchant.new(params[:merchant])

    respond_to do |format|
      if @merchant.save
        format.html { render action: "confirm", notice: 'Merchant was successfully created.' }
        format.json { render json: @merchant, status: :created, location: @merchant }
      else
        format.html { render action: "new" }
        format.json { render json: @merchant.errors, status: :unprocessable_entity }
      end
    end
 
 end
  
  
  
  
  def edit
    @merchant = Merchant.find(params[:id])

    respond_to do |format|
      if @merchant.update_attributes(params[:merchant])
        format.html { render "confirm", notice: 'Merchant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @merchant.errors, status: :unprocessable_entity }
      end
    end
    end
    
    def show
      @merchant = Merchant.find(params[:id])
      @product = Product.find_all_by_merchant_id(@merchant.id)
      
    end
  
    def index
      @merchant = Merchant.all
    end
    
    def follow_this_store
      @merchant = Merchant.find(params[:id])
      merchant_follower =MerchantFollower.new(:merchant_id=> @merchant.id,:user_id => current_user.id,:status=> 'Y')
      merchant_follower.save
     redirect_to merchant_path(@merchant.id)
   end
   
   def unfollow_this_store
     @merchant = Merchant.find(params[:id])
     @merchant_unfollow = MerchantFollower.find_by_merchant_id_and_user_id(@merchant.id,current_user.id)
     @merchant_unfollow.destroy
     redirect_to merchant_path(@merchant.id)
   end
    
    
 
end
