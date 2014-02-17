class AddUserIdToDeviceApplies < ActiveRecord::Migration
  def change
    add_column :device_applies, :user_id, :integer
	add_index :device_applies, :user_id
  end
end
