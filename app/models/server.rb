class Server < ApplicationRecord
  belongs_to :server_device
  belongs_to :restaurant

  enum server_status: {
    ok:    0,
    error: 1
  }, _prefix: :server_status

  enum restaurant_status: {
    ok:       0,
    warning:  1,
    error:    2
  }, _prefix: :restaurant_status
end
