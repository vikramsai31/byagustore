class CategoryController < ApplicationController
  
  def index 
    @category = Category.all
   
  end
  
  def show
    @product = Product.all 
    @category = Category.find(params[:id])
    @category_div = Category.get_category
    
     respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end
  end
end
