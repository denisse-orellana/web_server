class CreateDeviceServers < ActiveRecord::Migration[5.2]
  def change
    create_table :device_servers do |t|
      t.string :name
      t.integer :status, default: 0
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
