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
class Server < ApplicationRecord
  belongs_to :device_server
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

  def update_servers_every_30_seconds
    # To prevent a infinite while loop the servers will be updated only 3 times
    $updated_from = 0
    $updated_until = 3
    $seconds = 30
    
    while $updated_from < $updated_until  do
      Server.update_server_statuses
      sleep $seconds
      $updated_from += 1
    end
  end
end
