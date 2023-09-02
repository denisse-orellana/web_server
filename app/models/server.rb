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

  def is_updated?(server, device)
    server.server_update != device.updated_at
  end

  def self.update_server_statuses
    @devices = DeviceServer.all
    @devices.each do |device|
      @server = Server.new(
        server_name:        device.name,
        server_status:      device.status,
        server_update:      device.updated_at,
        device_server_id:   device.id,
        restaurant_name:    device.restaurant.name,
        restaurant_status:  device.restaurant.status,
        restaurant_update:  device.restaurant.updated_at,
        restaurant_id:      device.restaurant.id
      )
      @server.save
    end

    puts "####### Total servers updated: #{@devices.size} ######"
  end
end
