# == Schema Information
#
# Table name: invoices
#
#  id              :integer
#  order_id        :integer
#  amount          :decimal(8, 2)
#  invoice_type    :string(35)       default("purchase")
#  state           :string(55)
#  active          :string(1)        default("Y")
#  created_at      :timestamp        not null
#  updated_at      :timestamp        not null
#  credited_amount :decimal(8, 2)
#

require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
