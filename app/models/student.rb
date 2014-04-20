class Student < ActiveRecord::Base
  belongs_to :school
  #belongs_to :coach, through: :school
  scope :by_name, ->(first_name='', last_name='') {where('lower(first_name)=? and lower(last_name)=?', first_name.downcase, last_name.downcase ) }
  
  def self.import_row( hash_row, school )
    first_name = hash_row["Child Name (First)"]
    last_name = hash_row["Child Name (Last)"]
    if first_name && last_name
      student = Student.by_name( first_name, last_name ).first
      if student.nil?
        student = Student.new
      end
      if school
        student.school_id = school.id
      end
      student.first_name = first_name
      student.last_name = last_name
      student.save
      student
    end
  end
end
