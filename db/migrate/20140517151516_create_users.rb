class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :email_address
      t.text :password

      t.timestamps
    end
  end
end
