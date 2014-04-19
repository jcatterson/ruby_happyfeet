class Coach < ActiveRecord::Base
  has_many :schools
  has_many :students, through: :schools
  
  def full_name
    first_name + " " + last_name
  end
end
