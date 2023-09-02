# == Schema Information
#
# Table name: servers
#
#  id                :bigint           not null, primary key
#  server_name       :string
#  server_status     :integer          default("ok")
#  server_update     :datetime
#  device_server_id  :bigint
#  restaurant_name   :string
#  restaurant_status :integer          default("ok")
#  restaurant_update :datetime
#  restaurant_id     :bigint
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
require 'test_helper'

class ServerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
