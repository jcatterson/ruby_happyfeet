class AddNameRemoveSchoolIdToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :school_id, :integer
  end
end
