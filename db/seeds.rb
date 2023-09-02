# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts '### Initial Seed ###'

@restaurant_1 = Restaurant.new(
  name: 'Sushi Food',
  status: 'ok'
)

@restaurant_1.device_servers.new(
  name: 'Printer',
  status: 'ok'
)

@restaurant_1.device_servers.new(
  name: 'Server Web',
  status: 'ok'
)

@restaurant_1.device_servers.new(
  name: 'Database Server',
  status: 'error'
)
@restaurant_1.save

@main_server = MainServer.new(
  restaurant_id: @restaurant_1.id
)
@main_server.save

@restaurant_2 = Restaurant.new(
  name: 'Mexican Food',
  status: 'ok'
)

@restaurant_2.device_servers.new(
  name: 'Printer',
  status: 'ok'
)

@restaurant_2.device_servers.new(
  name: 'Server Web',
  status: 'ok'
)

@restaurant_2.device_servers.new(
  name: 'Database Server',
  status: 'error'
)
@restaurant_2.save

@main_server = MainServer.new(
  restaurant_id: @restaurant_2.id
)
@main_server.save

# Create register server 
@restaurant_1.device_servers.each do |device|
  @server = Server.new(
    server_name:        device.name,
    server_status:      device.status,
    server_update:      device.updated_at,
    device_server_id:   device.id,
    restaurant_name:    @restaurant_1.name,
    restaurant_status:  @restaurant_1.status,
    restaurant_update:  @restaurant_1.updated_at,
    restaurant_id:      @restaurant_1.id
  )
  @server.save
end

@restaurant_2.device_servers.each do |device|
  @server = Server.new(
    server_name:        device.name,
    server_status:      device.status,
    server_update:      device.updated_at,
    device_server_id:   device.id,
    restaurant_name:    @restaurant_2.name,
    restaurant_status:  @restaurant_2.status,
    restaurant_update:  @restaurant_2.updated_at,
    restaurant_id:      @restaurant_2.id
  )
  @server.save
end

puts '### 2 Restaurats created ###'

puts '### 6 Device Servers created ###'
