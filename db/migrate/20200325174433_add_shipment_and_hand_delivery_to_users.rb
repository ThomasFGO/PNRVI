class AddShipmentAndHandDeliveryToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :shipment, :boolean
    add_column :users, :hand_delivery, :boolean
  end
end
