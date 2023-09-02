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
