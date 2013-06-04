# == Schema Information
#
# Table name: addresses
#
#  id               :integer          not null, primary key
#  first_name       :string(30)
#  last_name        :string(30)
#  addressable_type :string(5)
#  addressable_id   :integer
#  address1         :string(255)
#  address2         :string(255)
#  city             :string(255)
#  state            :string(25)
#  zip              :string(10)
#  phone            :string(12)
#  adefault         :string(10)
#  billing_default  :string(10)
#  active           :string(3)
#  created_at       :datetime
#  updated_at       :datetime
#  user_id          :integer
#  name             :string(20)
#

require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
