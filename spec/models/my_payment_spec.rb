# == Schema Information
#
# Table name: my_payments
#
#  id               :integer          not null, primary key
#  email            :string
#  ip               :string
#  fee              :decimal(6, 2)
#  paypal_id        :string
#  total            :decimal(8, 2)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  shopping_cart_id :integer
#  status           :string
#

require 'rails_helper'

RSpec.describe MyPayment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
