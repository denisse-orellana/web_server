# == Schema Information
#
# Table name: device_servers
#
#  id            :bigint           not null, primary key
#  name          :string
#  status        :integer          default("ok")
#  restaurant_id :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require 'test_helper'

class DeviceServerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
