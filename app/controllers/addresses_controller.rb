class AddressesController < ApplicationController
    before_filter :authenticate_user!
  
  def index
    @addresses = current_user.addresses
  end
  
  def new
    @address = Address.new
    
     respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @address }
    end
  end
  
  def update
    
  end
  
  def create
    
    @address = current_user.addresses.new(params[:address])
    @address.save
     if @address.save
     render action "show"
     else
       render action "new"
       flash[:error] ="Address Cannot be Saved"
     end
  end
    
    
  
  
  def show
    @address = current_user.addresses
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @address }
    end
  end
  
  def destroy
    @address = Address.find(params[:id])
    @address.destroy

    respond_to do |format|
      format.html { redirect_to addresses_url }
      format.json { head :no_content }
    end
  end
  
  def select_address
    @address = current_user.addresses.find(params[:id])
      update_order_address_id(@address.id)
     redirect_to edit_order_path(session_order)
 end
 
 private
 
 def update_order_address_id(id)
  session_order.update_attributes(:shipping_address_id => id)
 end 
 
end
