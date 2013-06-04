class HomeController < ApplicationController
  def index
  	@product = Product.all
  	@category = Category.all
  	@featured = Product.where("featured_product = ?", "N")
  	#@category_div = @category.group_by{ |t| t.division}
  	@category_div = Category.get_category
  	#@photo = Product.photos.first(:product_id)
  	
  end
end
