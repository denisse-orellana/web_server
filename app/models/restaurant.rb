# == Schema Information
#
# Table name: restaurants
#
#  id         :bigint           not null, primary key
#  name       :string
#  status     :integer          default("ok")
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Restaurant < ApplicationRecord
  has_many :device_servers, dependent: :destroy
  accepts_nested_attributes_for :device_servers, reject_if: :all_blank, allow_destroy: true

  has_many :main_server, dependent: :destroy
  has_one :server, dependent: :destroy

  enum status: {
    ok:       0,
    warning:  1,
    error:    2
  }

  def self.status_description_restaurant
    {
      "All the devices/servers are in status 'ok'"      => 'ok',
      "All the devices/servers are in status 'warning'" => 'warning',
      "All the devices/servers are in status 'error'"   => 'error',
    }
  end

  default_scope -> { where( "deleted_at IS NULL" ) }

  validates :name, presence: true
  validates :status, presence: true
  validates_presence_of :device_servers

  after_save :update_restaurant_statuses

  def update_restaurant_statuses
    if self.device_servers.where(status: "error").size == 0
      self.update_column(:status, "ok" )
    elsif self.device_servers.where(status: "error").size == 1
      self.update_column(:status, "warning" )
    elsif self.device_servers.where(status: "error").size == 2
      self.update_column(:status, "error" )
    elsif self.device_servers.where(status: "error").size == 3
      self.update_column(:status, "error" )
    end
  end

  def create_server(restaurant)
    restaurant.device_servers.each do |device|
      @server = Server.new(
        server_name:        device.name,
        server_status:      device.status,
        server_update:      device.updated_at,
        device_server_id:   device.id,
        restaurant_name:    restaurant.name,
        restaurant_status:  restaurant.status,
        restaurant_update:  restaurant.updated_at,
        restaurant_id:      restaurant.id
      )
      @server.save
    end
  end
end
