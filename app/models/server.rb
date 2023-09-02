class Server < ApplicationRecord
  belongs_to :server_device
  belongs_to :restaurant
end
