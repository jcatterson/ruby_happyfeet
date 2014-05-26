class AddSerialToUsers < ActiveRecord::Migration
  def change
    add_column :users, :serial, :string
  end
end
