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
class DeviceServer < ApplicationRecord
  belongs_to :restaurant

  has_one :server, dependent: :destroy

  enum status: {
    ok:    0,
    error: 1
  }
  
  def self.status_description_device_server
    {
      "The device/service was successfully connected"  => 'ok',
      "The device/service could not be connected"      => 'error',
    }
  end

  validates :name, presence: true
  validates :status, presence: true
end
