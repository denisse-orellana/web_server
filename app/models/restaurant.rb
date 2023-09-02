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
end
