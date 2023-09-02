class Restaurant < ApplicationRecord
  has_many :device_servers, dependent: :destroy
  accepts_nested_attributes_for :device_servers, reject_if: :all_blank, allow_destroy: true

  has_many :main_server, dependent: :destroy
  has_one :server, dependent: :destroy
end
