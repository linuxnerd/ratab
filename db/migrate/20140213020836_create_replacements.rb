class CreateReplacements < ActiveRecord::Migration
  def change
    create_table :replacements do |t|
      t.date :replacement_date
      t.string :reason
      t.integer :device_num
      t.string :imei
      t.integer :sim_num
      t.string :sim_sn
      t.integer :device_apply_id

      t.timestamps
    end
	add_index :replacements, :device_apply_id
  end
end
