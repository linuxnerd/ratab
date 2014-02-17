class CreateDeviceApplies < ActiveRecord::Migration
  def change
    create_table :device_applies do |t|
      t.string :provider
      t.date :provider_date
      t.string :brand
      t.string :model
      t.string :operators
      t.string :procurement_method
      t.integer :device_num
      t.string :imei
      t.integer :sim_num
      t.string :sim_sn
      t.string :apply_reason
      t.integer :branch_id
      t.string :contacts
      t.string :contact_phone
      t.string :remarks
      t.string :status

      t.timestamps
    end
  end
end
