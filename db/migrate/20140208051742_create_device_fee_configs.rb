class CreateDeviceFeeConfigs < ActiveRecord::Migration
  def change
    create_table :device_fee_configs do |t|
      t.string :settlement_date
      t.string :unicom_device_price
      t.string :unicom_data_price
      t.string :telecom_device_price
      t.string :telecom_data_price

      t.timestamps
    end
  end
end
