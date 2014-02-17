class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :branch_number
      t.string :branch_name
      t.string :branch_address

      t.timestamps
    end
  end
end
