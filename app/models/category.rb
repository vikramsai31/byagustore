# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  division    :string(100)
#  subdivision :string(100)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Category < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :products
  #has_many :subdivisons, :class_name => "Category, " through => :division
  attr_accessible :division,:subdivision
  
  def  self.get_category
     category = Category.all
     category_div = category.group_by{ |t| t.division}
     return category_div
  end
  
 

end
