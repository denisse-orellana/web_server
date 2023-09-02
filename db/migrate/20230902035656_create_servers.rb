class CreateServers < ActiveRecord::Migration[5.2]
  def change
    create_table :servers do |t|
      t.string :server_name
      t.integer :server_status, default: 0
      t.datetime :server_update
      t.references :device_server, foreign_key: true
      t.string :restaurant_name
      t.integer :restaurant_status, default: 0
      t.datetime :restaurant_update
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
