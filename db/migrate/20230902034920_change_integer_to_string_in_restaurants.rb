class ChangeIntegerToStringInRestaurants < ActiveRecord::Migration[5.2]
  def change
    change_column :restaurants, :status, :integer, using: 'status::integer', default: 0
  end
end
