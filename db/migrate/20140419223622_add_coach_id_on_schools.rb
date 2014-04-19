class AddCoachIdOnSchools < ActiveRecord::Migration
  def change
    add_column :schools, :coach_id, :integer
  end
end
