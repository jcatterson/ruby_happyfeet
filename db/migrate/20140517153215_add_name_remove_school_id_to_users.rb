class AddNameRemoveSchoolIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    remove_column :users, :school_id, :integer
  end
end
