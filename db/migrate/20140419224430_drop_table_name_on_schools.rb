class DropTableNameOnSchools < ActiveRecord::Migration
  def change
    drop_table :name_on_schools
  end
end
