class AddIsPaidToStudents < ActiveRecord::Migration
  def change
    add_column :students, :ispaid, :boolean
  end
end
