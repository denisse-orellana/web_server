# == Schema Information
#
# Table name: restaurants
#
#  id         :bigint           not null, primary key
#  name       :string
#  status     :integer          default("ok")
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
