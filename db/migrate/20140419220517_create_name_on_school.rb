class CreateNameOnSchool < ActiveRecord::Migration
  def change
    create_table :name_on_schools do |t|
      t.text :name
    end
  end
end
