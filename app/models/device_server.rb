class DeviceServer < ApplicationRecord
  belongs_to :restaurant

  has_one :server, dependent: :destroy

end
