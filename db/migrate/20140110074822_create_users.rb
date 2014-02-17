class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :role, default: 'user'
      t.string :phone
      t.string :last_ip

      t.timestamps
    end
  end
end
