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

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
